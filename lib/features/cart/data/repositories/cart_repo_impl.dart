import 'package:dartz/dartz.dart';
import 'package:e_commerce_cart_system/core/error/failure.dart';
import 'package:e_commerce_cart_system/features/cart/data/models/product_model.dart';
import 'package:e_commerce_cart_system/features/cart/domain/repositories/cart_repo.dart';

import '../../../../core/base/service_locator.dart';
import '../datasources/local_cart_data_source.dart';

class CartRepoImpl implements CartRepo {
  final LocalCartDataSource localDataSource;

  CartRepoImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<ProductModel>>> loadCart() async {
    try {
      final result = await localDataSource.loadCart();
      return Right(result);
    } catch (e) {
      return Left(CustomFailure(data: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> saveCart(List<ProductModel> products) async {
    try {
      await localDataSource.saveCart(products);
      return const Right(true);
    } catch (e) {
      return Left(CustomFailure(data: e.toString()));
    }
  }
}
