import 'dart:math';

import 'package:e_commerce_cart_system/features/cart/application/discount_strategy/discount_strategy.dart';

class FixedDiscountStrategy extends DiscountStrategy {
  final double _amount;
  final String _promoCode;
  FixedDiscountStrategy({required String code, required double amount})
      : _amount = amount,
        _promoCode = code;
  @override
  double call(double totalAmount) {
    return max(totalAmount - _amount, 0);
  }

  @override
  String get name => _promoCode;

  @override
  double get discount => _amount;

  @override
  String toString() {
    return "$_amount\$";
  }
}
