part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props =>
      [identityHashCode(this)]; // Unique identifier for the state
}

class CartInitial extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
  final List<ProductModel> products;
  final double totalBeforeDiscount;
  final double totalAfterDiscount;
  final double discount;
  const CartLoadedState(
      {required this.products,
      required this.totalBeforeDiscount,
      required this.totalAfterDiscount,
      required this.discount});
}

class CartErrorState extends CartState {
  final String message;
  const CartErrorState(this.message);

  @override
  List<Object> get props => [message, identityHashCode(this)];
}
