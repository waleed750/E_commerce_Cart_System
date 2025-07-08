abstract class DiscountStrategy {
  String get name;
  double call(double totalAmount);
  double get discount;
}
