import 'package:e_commerce_cart_system/core/core_export.dart';

import '../models/product_model.dart';

abstract class LocalCartDataSource {
  Future<void> saveCart(List<ProductModel> products);
  Future<List<ProductModel>> loadCart();
}

class LocalCartDataSourceImpl implements LocalCartDataSource {
  final appPrefs = serviceLocator<AppPreferences>();
  @override
  Future<void> saveCart(List<ProductModel> products) async {
    await appPrefs.setCart(products);
  }

  @override
  Future<List<ProductModel>> loadCart() async {
    return await appPrefs.getCart();
  }
}
