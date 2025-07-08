// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../../features/cart/presentation/cubit/cart_cubit.dart';
import '../../../features/cart/presentation/pages/cart_details_page.dart';
import '../../../features/features_export.dart';
import '../../../features/home/presentation/cubit/home_cubit.dart';
import '../../../features/home/presentation/pages/home_page.dart';
import '../../core_export.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RouteNames.home,
  routes: [
    GoRoute(
      path: RouteNames.splash,
      name: RouteNames.splash,
      builder: (context, state) => BlocProvider(
          create: (context) => serviceLocator<SplashCubit>(),
          child: const SplashPage()),
    ),
    ShellRoute(
        builder: (context, state, child) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      serviceLocator<HomeCubit>()..loadProducts(),
                ),
                BlocProvider(
                  create: (context) => serviceLocator<CartCubit>()..loadCart(),
                ),
              ],
              child: child,
            ),
        routes: [
          GoRoute(
            path: RouteNames.home,
            name: RouteNames.home,
            pageBuilder: (context, state) => CupertinoPage(
              child: const HomePage(),
            ),
          ),
          GoRoute(
              path: RouteNames.cartDetails,
              name: RouteNames.cartDetails,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  child: const CartDetailsPage(),
                );
              }),
        ])
  ],
);
