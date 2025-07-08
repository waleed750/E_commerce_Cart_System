import 'dart:developer';

import 'package:e_commerce_cart_system/features/cart/application/discount_strategy/fixed_discount_strategy.dart';
import 'package:e_commerce_cart_system/features/cart/application/discount_strategy/perecent_discount_strategy.dart';

import '../../../../core/core_export.dart';
import '../cubit/cart_cubit.dart';
import '../widgets/cart_item_card.dart';
import '../widgets/cartt_summary_section.dart';
import '../widgets/coupon_code_card.dart';
import '../widgets/cart_section_widget.dart';

class CartDetailsPage extends StatelessWidget {
  const CartDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Details"),
        forceMaterialTransparency: false,
        surfaceTintColor: AppColors.background,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.primary,
          ),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       // Handle search action
        //     },
        //     icon: const Icon(
        //       Icons.,
        //       color: AppColors.primary,
        //     ),
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      if (state is CartLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is CartLoadedState) {
                        return Column(
                          children: state.products
                              .map((e) => CartItemCard(
                                    product: e,
                                    onRemove: () => cubit.removeFromCart(e.id),
                                    onDecrease: () =>
                                        cubit.decrementItemQuantity(e.id),
                                    onIncrease: () =>
                                        cubit.incrementItemQuantity(e.id),
                                  ))
                              .toList(),
                        );
                      } else if (state is CartErrorState) {
                        return Center(child: Text(state.message));
                      } else {
                        return const Center(
                            child: Text("Something went wrong"));
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      final cubit = context.read<CartCubit>();
                      return CartSectionWidget(
                        title: "Coupon Codes",
                        children: [
                          CouponCodeCard(
                            code: PerecentDiscountStrategy(
                                percent: 10, promoCode: "giveMeDiscount"),
                            applied: cubit.isPomodoroApplied("giveMeDiscount"),
                            onApply: (promo) => {
                              cubit.applyOrRemoveDiscount(promo)
                            }, // handle apply
                          ),
                          CouponCodeCard(
                            code: FixedDiscountStrategy(
                                code: "waleed", amount: 50),
                            applied: cubit.isPomodoroApplied("waleed"),
                            onApply: (promo) => {
                              cubit.applyOrRemoveDiscount(promo)
                            }, // handle apply
                          ),
                        ],
                      );
                    },
                  ),
                  BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      double cartTotalAfterDiscount = 0;
                      double discountAmount = 0;
                      double cartTotalBeforeDiscount = 0;
                      if (state is CartLoadedState) {
                        cartTotalAfterDiscount = state.totalAfterDiscount;
                        cartTotalBeforeDiscount = state.totalBeforeDiscount;
                        discountAmount = state.discount;
                      }
                      log("cartTotalAfterDiscount $cartTotalAfterDiscount , cartTotalBeforeDiscount $cartTotalBeforeDiscount , discountAmount $discountAmount");
                      return CartSummarySection(
                        itemTotalBeforeDiscount: cartTotalBeforeDiscount,
                        discount: discountAmount,
                        deliveryCharge: 0,
                        itemTotalAfterDiscount: cartTotalAfterDiscount,
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
