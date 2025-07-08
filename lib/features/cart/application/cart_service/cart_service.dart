import 'dart:math';

import 'package:e_commerce_cart_system/features/cart/application/discount_strategy/discount_strategy.dart';
import 'package:e_commerce_cart_system/features/cart/data/models/product_model.dart';

class CartService {
  List<ProductModel> cartItems = [];
  List<DiscountStrategy> discountStrategies = [];
  double _cachedTotal = 0;

  // Getters
  double get totalAfterDiscount {
    if (discountStrategies.isNotEmpty) {
      return discountStrategies.fold(
        _cachedTotal,
        (sum, item) {
          return item(sum);
        },
      );
    } else {
      return _cachedTotal;
    }
  }

  double get totalBeforeDiscount => _cachedTotal;

  double get totalDiscount => max(_cachedTotal - totalAfterDiscount, 0);

  // Promo Code
  bool isPromoCodeApplied(String name) =>
      discountStrategies.any((item) => item.name == name);
  bool addPromoCode(DiscountStrategy discount) {
    final index =
        discountStrategies.indexWhere((item) => item.name == discount.name);
    if (index == -1) {
      discountStrategies.add(discount);
      return true;
    }
    return false;
  }

  void removePromoCode(String name) {
    final index = discountStrategies.indexWhere((item) => item.name == name);
    if (index != -1) {
      discountStrategies.removeAt(index);
    }
  }

  // Cart Items

  void addItemToCart(ProductModel product) {
    final index = cartItems.indexWhere((item) => item.id == product.id);
    //Avoid Duplication
    if (index == -1) {
      cartItems.add(product);
      _cachedTotal += product.price;
    }
  }

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
