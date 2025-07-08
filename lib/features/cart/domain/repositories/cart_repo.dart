import 'package:dartz/dartz.dart';
import 'package:e_commerce_cart_system/features/cart/data/models/product_model.dart';

import '../../../../core/error/failure.dart';

abstract class CartRepo {
  /// Adds an item to the cart.
  Future<Either<Failure, bool>> saveCart(List<ProductModel> products);
  Future<Either<Failure, List<ProductModel>>> loadCart();
}
