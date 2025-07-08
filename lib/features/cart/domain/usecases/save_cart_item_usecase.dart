import 'package:dartz/dartz.dart' show Either;
import 'package:e_commerce_cart_system/core/core_export.dart';

import '../../data/models/product_model.dart';
import '../repositories/cart_repo.dart';

class SaveCartItemUsecase implements UseCase<bool, List<ProductModel>> {
  final _cartRepo = serviceLocator<CartRepo>();

  @override
  Future<Either<Failure, bool>> call(List<ProductModel> params) async {
    return await _cartRepo.saveCart(params);
  }
}
