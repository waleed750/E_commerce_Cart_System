import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_cart_system/features/home/data/mockup/mockup_products.dart';
import 'package:equatable/equatable.dart';

import '../../../cart/data/models/product_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required MockupProducts mockupProducts})
      : _mockupProducts = mockupProducts,
        super(HomeInitial());
  final MockupProducts _mockupProducts;

  /// Loads dummy products into state
  void loadProducts() {
    final products = _mockupProducts.generateProducts();
    emit(HomeLoadedState(products));
  }
}
