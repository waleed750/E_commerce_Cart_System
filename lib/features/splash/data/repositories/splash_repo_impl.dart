import 'package:dartz/dartz.dart';
import 'package:e_commerce_cart_system/features/splash/data/datasources/local_datasource.dart';

import '../../../../core/core_export.dart';
import '../../splash_export.dart';

class SplashRepoImpl implements SplashRepo {
  final _localDatasourse = serviceLocator<SplashLocalDatasourceImpl>();

  @override
  Future<Either<Failure, bool>> isOnBoarding() async {
    try {
      final result = await _localDatasourse.isOnBoarding();
      return Right(result);
    } catch (e) {
      return Left(CustomFailure(data: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> saveOnBoarding() async {
    try {
      final result = await _localDatasourse.saveonBoarding();
      return Right(result);
    } catch (e) {
      return Left(CustomFailure(data: e.toString()));
    }
  }
}
