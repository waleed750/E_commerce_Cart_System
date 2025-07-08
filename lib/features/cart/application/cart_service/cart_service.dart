import 'package:e_commerce_cart_system/features/cart/data/models/product_model.dart';
import '../discount_strategy/discount_strategy.dart';

abstract class ICartService {
  double get totalAfterDiscount;
  double get totalBeforeDiscount;
  double get totalDiscount;

  List<ProductModel> get cartItems;
  List<DiscountStrategy> get discountStrategies;

  bool addPromoCode(DiscountStrategy discount);
  bool isPromoCodeApplied(String name);
  void removePromoCode(String name);

  void addItemToCart(ProductModel product);
  ProductModel? removeItemFromCart(int id);
  ProductModel? incrementItemQuantity(int id);
  ProductModel? decrementItemQantity(int id);

  void updateCart(List<ProductModel> products);
}
