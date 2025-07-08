part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [identityHashCode(this)];
}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<ProductModel> products;
  const HomeLoadedState(this.products);
}

class LoadCartItemsState extends HomeState {
  final List<ProductModel> cartItems;
  final double total;

  const LoadCartItemsState(this.cartItems, this.total);

  @override
  List<Object> get props => [cartItems, total, identityHashCode(this)];
}
