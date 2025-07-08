part of 'splash_cubit.dart';

abstract class SplashState extends Equatable {
  final String? title;
  final String? message;

  const SplashState({this.title, this.message});

  @override
  List<Object> get props => [identityHashCode(this)];
}

class SplashInitial extends SplashState {}

class SplashSuccessState extends SplashState {}

class SplashErrorState extends SplashState {
  const SplashErrorState({super.title, super.message});
}

class SplashOnBoardingSavedState extends SplashState {
  const SplashOnBoardingSavedState({super.title, super.message});
}
