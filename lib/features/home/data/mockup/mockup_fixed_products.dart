import 'package:e_commerce_cart_system/features/cart/data/models/product_model.dart';
import 'package:e_commerce_cart_system/features/home/data/mockup/mockup_products.dart';
import '../../../../core/core_export.dart';

class MockupFixedProducts extends MockupProducts {
  @override
  List<ProductModel> generateProducts() {
    return [
      ProductModel(
        id: 1,
        name: 'Smart Hub DCC',
        quantity: 1,
        price: 99.0,
        imagePath: AppImages.png.dcc,
      ),
      ProductModel(
        id: 2,
        name: 'Huawei Freebuds',
        quantity: 1,
        price: 149.0,
        imagePath: AppImages.png.freebuds,
      ),
      ProductModel(
        id: 3,
        name: 'Apple MacBook',
        quantity: 1,
        price: 249.0,
        imagePath: AppImages.png.macbook,
      ),
      ProductModel(
        id: 4,
        name: 'Office Plant',
        quantity: 1,
        price: 59.0,
        imagePath: AppImages.png.plant1,
      ),
      ProductModel(
        id: 5,
        name: 'Living Room Plant',
        quantity: 1,
        price: 79.0,
        imagePath: AppImages.png.plant2,
      ),
      ProductModel(
        id: 6,
        name: 'Bedroom Plant',
        quantity: 1,
        price: 89.0,
        imagePath: AppImages.png.plant3,
      ),
      ProductModel(
        id: 7,
        name: 'Mini Desktop Plant',
        quantity: 1,
        price: 49.0,
        imagePath: AppImages.png.plant1,
      ),
      ProductModel(
        id: 8,
        name: 'Bamboo Decor',
        quantity: 1,
        price: 109.0,
        imagePath: AppImages.png.plant2,
      ),
      ProductModel(
        id: 9,
        name: 'Succulent Set',
        quantity: 1,
        price: 69.0,
        imagePath: AppImages.png.plant3,
      ),
      ProductModel(
        id: 10,
        name: 'Hanging Pot',
        quantity: 1,
        price: 119.0,
        imagePath: AppImages.png.plant1,
      ),
    ];
  }
}
