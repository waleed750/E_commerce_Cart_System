import 'dart:math';

import 'package:e_commerce_cart_system/features/cart/application/cart_service/cart_service.dart';
import 'package:e_commerce_cart_system/features/cart/application/discount_strategy/discount_strategy.dart';
import 'package:e_commerce_cart_system/features/cart/data/models/product_model.dart';

class CartService extends ICartService {
  @override
  List<ProductModel> cartItems = [];
  @override
  List<DiscountStrategy> get discountStrategies => _discountStrategies.toList();

  Set<DiscountStrategy> _discountStrategies = {};

  double _cachedTotal = 0;

  // Getters
  @override
  double get totalAfterDiscount {
    if (_discountStrategies.isNotEmpty) {
      return _discountStrategies.fold(
        _cachedTotal,
        (sum, item) {
          return item(sum);
        },
      );
    } else {
      return _cachedTotal;
    }
  }

  @override
  double get totalBeforeDiscount => _cachedTotal;

  @override
  double get totalDiscount => max(_cachedTotal - totalAfterDiscount, 0);

  // Promo Code
  @override
  bool isPromoCodeApplied(String name) =>
      _discountStrategies.any((item) => item.name == name);
  @override
  bool addPromoCode(DiscountStrategy discount) {
    final found = _discountStrategies.any((item) => item.name == discount.name);
    if (!found) {
      _discountStrategies.add(discount);
      return true;
    }
    return false;
  }

  @override
  void removePromoCode(String name) {
    final index = discountStrategies.indexWhere((item) => item.name == name);
    if (index != -1) {
      discountStrategies.removeAt(index);
    }
  }

  // Cart Items

  @override
  void addItemToCart(ProductModel product) {
    final index = cartItems.indexWhere((item) => item.id == product.id);
    //Avoid Duplication
    if (index == -1) {
      cartItems.add(product);
      _cachedTotal += product.price;
    }
  }

  @override
  ProductModel? removeItemFromCart(int id) {
    final index = cartItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      final existing = cartItems[index];
      _cachedTotal -= existing.price * existing.quantity;
      cartItems.removeAt(index);
      return existing;
    }

    return null; // not Found
  }

  // Quantity

  @override
  ProductModel? incrementItemQuantity(int id) {
    final index = cartItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      final existing = cartItems[index];
      final updated = existing.copyWith(quantity: existing.quantity + 1);
      cartItems[index] = updated;
      _cachedTotal += existing.price;
      return updated;
    }

    return null; // not Found
  }

  @override
  ProductModel? decrementItemQantity(int id) {
    final index = cartItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      final existing = cartItems[index];
      if (existing.quantity > 1) {
        final updated = existing.copyWith(quantity: existing.quantity - 1);
        cartItems[index] = updated;
        _cachedTotal -= existing.price;
        return updated;
      }
      return existing; // in case if it is 1
    }
    return null; // not Found
  }
  // Upadte All Cart

  CartService clearCart() {
    final oldCart = copyWith();
    cartItems.clear();
    _cachedTotal = 0;
    return oldCart;
  }

  @override
  void updateCart(List<ProductModel> products) {
    cartItems.clear();
    // Clear cached total
    cartItems = products;
    // Ccalculate total
    _cachedTotal = products.fold(
      0.0,
      (sum, item) => sum + item.price * item.quantity,
    );
  }

  //Copy with
  CartService copyWith({
    List<ProductModel>? cartItems,
    double? cachedTotal,
  }) {
    return CartService()
      ..cartItems = cartItems ?? this.cartItems
      .._cachedTotal = cachedTotal ?? _cachedTotal;
  }
}
