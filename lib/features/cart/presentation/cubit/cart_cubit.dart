import 'package:dartz/dartz.dart';
import 'package:e_commerce_cart_system/core/core_export.dart';
import '../../application/cart_service/cart_service_impl.dart';
import '../../application/discount_strategy/discount_strategy.dart';
import '../../data/models/product_model.dart';
import '../../domain/usecases/load_cart_item_usecase.dart';
import '../../domain/usecases/save_cart_item_usecase.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(
      {required CartService cartService,
      required LoadCartItemsUsecase loadCartUsecase,
      required SaveCartItemUsecase saveCartUsecase})
      : _cartService = cartService,
        _loadCartUsecase = loadCartUsecase,
        _saveCartUsecase = saveCartUsecase,
        super(CartInitial());
  final _loadCartUsecase;
  final _saveCartUsecase;
  final _cartService;
  var noParams = NoParams();

  //Getter for Is Pomo Applied
  bool isPomodoroApplied(String name) => _cartService.isPromoCodeApplied(name);

  /// Loads the cart items from the local data source.
  Future<void> loadCart() async {
    emit(CartLoadingState());
    if (_cartService.cartItems.isNotEmpty) {
      emit(CartLoadedState(
          products: _cartService.cartItems,
          totalAfterDiscount: _cartService.totalAfterDiscount,
          totalBeforeDiscount: _cartService.totalBeforeDiscount,
          discount: _cartService.totalDiscount));
      return;
    }
    final result = await _loadCartUsecase(noParams);
    final failureOrDone = AppUtils.mapFailuerOrDone(either: result);
    if (failureOrDone.data != null) {
      _cartService.updateCart(failureOrDone.data as List<ProductModel>);
      emit(CartLoadedState(
          products: _cartService.cartItems,
          totalAfterDiscount: _cartService.totalAfterDiscount,
          totalBeforeDiscount: _cartService.totalBeforeDiscount,
          discount: _cartService.totalDiscount));
    } else {
      emit(CartErrorState(failureOrDone.failure?.msg ?? "Unknown error"));
    }
  }

  Future<void> applyOrRemoveDiscount(DiscountStrategy discount) async {
    final promoCode = _cartService.addPromoCode(discount);
    // In case if this promocode not Applied before
    if (promoCode) {
      await _updateStateOrRollback(
        saveAction: () => _saveCartUsecase(_cartService.cartItems),
        onRollback: () => _cartService.removePromoCode(discount.name),
      );
    } else {
      _cartService.removePromoCode(discount.name);
      await _updateStateOrRollback(
        saveAction: () => _saveCartUsecase(_cartService.cartItems),
        onRollback: () => _cartService.addPromoCode(discount),
      );
    }
    // In case of the promo code already Applied it will be removed
  }

  /// Adds an item and persists it (with rollback on failure)
  Future<void> addToCart(ProductModel product) async {
    _cartService.addItemToCart(product);

    await _updateStateOrRollback(
      saveAction: () => _saveCartUsecase(_cartService.cartItems),
      onRollback: () => _cartService.removeItemFromCart(product.id),
    );
  }

  /// Removes an item and persists it (with rollback on failure)
  Future<void> removeFromCart(int productId) async {
    final removed = _cartService.removeItemFromCart(productId);

    await _updateStateOrRollback(
      saveAction: () => _saveCartUsecase(_cartService.cartItems),
      onRollback: () {
        if (removed != null) _cartService.addItemToCart(removed);
      },
    );
  }

  // Increases the quantity of an item and persists it (with rollback on failure)
  Future<void> incrementItemQuantity(int productId) async {
    final updated = _cartService.incrementItemQuantity(productId);

    await _updateStateOrRollback(
      saveAction: () => _saveCartUsecase(_cartService.cartItems),
      onRollback: () {
        if (updated != null) _cartService.decrementItemQantity(updated.id);
      },
    );
  }

  // Decreases the quantity of an item and persists it (with rollback on failure)
  Future<void> decrementItemQuantity(int productId) async {
    final updated = _cartService.decrementItemQantity(productId);

    await _updateStateOrRollback(
      saveAction: () => _saveCartUsecase(_cartService.cartItems),
      onRollback: () {
        if (updated != null) _cartService.incrementItemQuantity(updated.id);
      },
    );
  }

  /// Clears the cart and persists the change (with rollback on failure)
  Future<void> clearCart() async {
    final oldCart = _cartService.clearCart();
    await _updateStateOrRollback(
      saveAction: () => _saveCartUsecase(_cartService.cartItems),
      onRollback: () => _cartService.updateCart(oldCart.cartItems),
    );
  }

  //Common method to handle state updates or rollbacks
  Future<void> _updateStateOrRollback({
    required Future<Either<Failure, Object>> Function() saveAction,
    required VoidCallback onRollback,
  }) async {
    final result = await saveAction();
    final mapped = AppUtils.mapFailuerOrDone(either: result);

    if (mapped.data != null) {
      emit(CartLoadedState(
          products: _cartService.cartItems,
          totalAfterDiscount: _cartService.totalAfterDiscount,
          totalBeforeDiscount: _cartService.totalBeforeDiscount,
          discount: _cartService.totalDiscount));
    } else {
      // If saving fails, rollback the cart service state
      onRollback();
      emit(CartErrorState(mapped.failure?.msg ?? "Failed to update cart"));
    }
  }
}
