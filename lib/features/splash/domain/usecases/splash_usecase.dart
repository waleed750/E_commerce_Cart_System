import 'package:dartz/dartz.dart';
import '../../../../core/core_export.dart';
import '../../splash_export.dart';

class SplashUsecase {
  final SplashRepo _splashRepo = serviceLocator<SplashRepo>();

  Future<Either<Failure, bool>> isOnBoarding(NoParams params) async {
    return await _splashRepo.isOnBoarding();
  }

  Future<Either<Failure, bool>> saveOnBoarding(NoParams params) async {
    return await _splashRepo.saveOnBoarding();
  }
}
