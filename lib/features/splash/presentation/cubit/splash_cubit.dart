// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'dart:developer';

import '../../../../core/core_export.dart';
import '../../splash_export.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  static SplashCubit get(BuildContext context) => BlocProvider.of(context);
  final _usecase = serviceLocator<SplashUsecase>();

  Future<void> saveOnBoarding() async {
    try {
      final result = await _usecase.saveOnBoarding(NoParams());
      final failurOrDone = AppUtils.mapFailuerOrDone(either: result);
      if (failurOrDone.data != null) {
        log('OnBoarding saved successfully');
        emit(SplashOnBoardingSavedState());
      } else {
        log('Failed to save OnBoarding: ${failurOrDone.failure?.msg}');
        emit(SplashErrorState(message: failurOrDone.failure?.msg));
      }
    } catch (e) {
      log('Exception in saveOnBoarding: $e');
      emit(SplashErrorState(message: e.toString()));
    }
  }

  Future<void> isOnBoarding() async {
    try {
      final result = await _usecase.isOnBoarding(NoParams());
      final failurOrDone = AppUtils.mapFailuerOrDone(either: result);
      if (failurOrDone.data != null) {
        log('OnBoarding status: ${failurOrDone.data}');
        emit(SplashSuccessState());
      } else {
        log('Failed to check OnBoarding status: ${failurOrDone.failure?.msg}');
        emit(SplashErrorState(message: failurOrDone.failure?.msg));
      }
    } catch (e) {
      log('Exception in isOnBoarding: $e');
      emit(SplashErrorState(message: e.toString()));
    }
  }
}
