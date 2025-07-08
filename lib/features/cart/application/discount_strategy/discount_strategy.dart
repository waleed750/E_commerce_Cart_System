import 'package:e_commerce_cart_system/core/core_export.dart';

abstract class DiscountStrategy extends Equatable {
  String get name;
  double call(double totalAmount);
  double get discount;
}
