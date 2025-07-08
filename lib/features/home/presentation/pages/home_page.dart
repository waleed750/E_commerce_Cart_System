import 'package:e_commerce_cart_system/core/utils/utils_epxort.dart';
import 'package:e_commerce_cart_system/features/home/presentation/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_cart_system/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:e_commerce_cart_system/features/home/presentation/cubit/home_cubit.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadedState) {
              return GridView.builder(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 80, // Space for FAB
                ),
                itemCount: state.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ProductCard(
                    product: product,
                    onAddToCart: (p0) {
                      // Add product to cart
                      context.read<CartCubit>().addToCart(product);
                    },
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          int itemCount = 0;
          if (state is CartLoadedState) {
            itemCount = state.products.length;
          }

          return Stack(
            alignment: Alignment.topRight,
            children: [
              FloatingActionButton(
                backgroundColor: AppColors.black,
                onPressed: () {
                  // Navigate to CartDetailsPage
                  context.pushNamed(
                    RouteNames.cartDetails,
                    extra: context.read<CartCubit>(),
                  );
                },
                shape: const CircleBorder(),
                child: const Icon(Icons.shopping_cart, color: AppColors.white),
              ),
              if (itemCount > 0)
                Positioned(
                  right: 0,
                  top: 0,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColors.primary,
                    child: Text(
                      itemCount.toString(),
                      style:
                          const TextStyle(fontSize: 12, color: AppColors.white),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
