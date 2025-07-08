import 'package:dartz/dartz.dart';
import 'package:e_commerce_cart_system/core/core_export.dart';

import '../../data/models/product_model.dart';
import '../repositories/cart_repo.dart';

class LoadCartItemsUsecase implements UseCase<List<ProductModel>, NoParams> {
  final _cartRepo = serviceLocator<CartRepo>();

  @override
  Future<Either<Failure, List<ProductModel>>> call(NoParams params) async {
    return await _cartRepo.loadCart();
  }
}
