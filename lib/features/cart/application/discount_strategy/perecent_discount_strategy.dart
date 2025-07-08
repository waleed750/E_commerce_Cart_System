import 'package:e_commerce_cart_system/features/cart/application/discount_strategy/discount_strategy.dart';

class PerecentDiscountStrategy extends DiscountStrategy {
  late final double _percent;
  late final String promoCode;
  PerecentDiscountStrategy({required percent, required this.promoCode})
      : _percent = percent.toDouble();
  @override
  double call(double totalAmount) {
    return totalAmount - (totalAmount * _percent / 100);
  }

  @override
  String get name => promoCode;

  @override
  double get discount => _percent;

  @override
  String toString() {
    return "$_percent%";
  }

  @override
  List<Object?> get props => [
        promoCode,
      ];
}
