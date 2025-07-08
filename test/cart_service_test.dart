import 'package:flutter_test/flutter_test.dart';
import 'package:e_commerce_cart_system/features/cart/application/cart_service/cart_service.dart';
import 'package:e_commerce_cart_system/features/cart/data/models/product_model.dart';
import 'package:e_commerce_cart_system/features/cart/application/discount_strategy/fixed_discount_strategy.dart';
import 'package:e_commerce_cart_system/features/home/data/mockup/mockup_products.dart';
import 'package:e_commerce_cart_system/features/home/data/mockup/mockup_fixed_products.dart';

void main() {
  group("Cart Service Test Cases", () {
    late CartService cartService;
    late MockupProducts mockupProducts;
    late List<ProductModel> products;

    setUp(() {
      cartService = CartService();
      mockupProducts = MockupFixedProducts();
      products = mockupProducts.generateProducts();
    });

    test("Add product to cart", () {
      for (var i = 0; i < 5; i++) {
        cartService.addItemToCart(products[i]);
      }
      expect(cartService.cartItems.length, 5);
      expect(cartService.totalBeforeDiscount, 635);
    });

    test("Remove product from cart", () {
      final product = products[0];
      cartService.addItemToCart(product);
      final removed = cartService.removeItemFromCart(products[0].id);
      expect(removed?.id, products[0].id);
      expect(cartService.cartItems.isEmpty, true);
    });

    test("Increment and Decrement quantity", () {
      cartService.addItemToCart(products[0]);
      final updated = cartService.incrementItemQuantity(products[0].id);
      expect(updated?.quantity, 2);
      expect(cartService.totalBeforeDiscount, products[0].price * 2);

      final decremented = cartService.decrementItemQantity(products[0].id);
      expect(decremented?.quantity, 1);
      expect(cartService.totalBeforeDiscount, products[0].price);
    });

    test("Clear cart resets state", () {
      cartService.updateCart(products);
      cartService.clearCart();
      expect(cartService.cartItems.isEmpty, true);
      expect(cartService.totalBeforeDiscount, 0);
    });

    test("Update cart sets new products and total", () {
      cartService.updateCart([products[0], products[1]]);
      expect(cartService.cartItems.length, 2);
      expect(cartService.totalBeforeDiscount,
          products[0].price + products[1].price);
    });

    test("Apply and remove FixedDiscountStrategy", () {
      cartService.updateCart([products[0]]);
      final promo = FixedDiscountStrategy(code: 'TEST10', amount: 10.0);

      final added = cartService.addPromoCode(promo);
      expect(added, true);
      expect(cartService.totalAfterDiscount, products[0].price - 10.0);

      cartService.removePromoCode('TEST10');
      expect(cartService.totalAfterDiscount, products[0].price);
    });

    test("Duplicate FixedDiscountStrategy is not added", () {
      final promo = FixedDiscountStrategy(code: 'SAME', amount: 5.0);
      expect(cartService.addPromoCode(promo), true);
      expect(cartService.addPromoCode(promo), false);
    });

    test("Total discount using FixedDiscountStrategy", () {
      cartService.addItemToCart(products[0]); // 99
      cartService
          .addPromoCode(FixedDiscountStrategy(code: 'DISC20', amount: 20));
      expect(cartService.totalDiscount, 20);
    });
  });
}
