import 'package:e_commerce_cart_system/features/cart/data/repositories/cart_repo_impl.dart';
import 'package:e_commerce_cart_system/features/home/data/mockup/mockup_products.dart';
import 'package:e_commerce_cart_system/features/home/data/mockup/mockup_fixed_products.dart';
import 'package:e_commerce_cart_system/features/splash/data/datasources/local_datasource.dart';
import 'package:get_it/get_it.dart';
import '../../features/cart/application/cart_service/cart_service.dart';
import '../../features/cart/data/datasources/local_cart_data_source.dart';
import '../../features/cart/domain/repositories/cart_repo.dart';
import '../../features/cart/domain/usecases/load_cart_item_usecase.dart';
import '../../features/cart/domain/usecases/save_cart_item_usecase.dart';
import '../../features/cart/presentation/cubit/cart_cubit.dart';
import '../../features/features_export.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../core_export.dart';

final serviceLocator = GetIt.instance;

Future<void> initServiceLocator() async {
  //! ############################### Package ###############################

  //! ############################### Service ###############################
  Bloc.observer = AppBlocObserver();
  serviceLocator.registerSingleton(
    () => AppPreferences()..init(),
  );
  //! ################################ Datasources #################################
  serviceLocator.registerLazySingleton<SplashLocalDatasource>(
    () => SplashLocalDatasourceImpl(serviceLocator<AppPreferences>()),
  );
  serviceLocator.registerLazySingleton<LocalCartDataSource>(
    () => LocalCartDataSourceImpl(),
  );
  //! ################################# Repository #################################

  serviceLocator.registerLazySingleton<SplashRepo>(() => SplashRepoImpl());
  serviceLocator.registerLazySingleton<CartRepo>(() => CartRepoImpl());
  //! ################################# Usecases #################################

  serviceLocator.registerLazySingleton(() => SplashUsecase());
  serviceLocator.registerLazySingleton(() => LoadCartItemsUsecase());
  serviceLocator.registerLazySingleton(() => SaveCartItemUsecase());

  //! ############################### Bloc Or Cubit ###############################
  serviceLocator.registerFactory(() => SplashCubit());
  serviceLocator.registerFactory(() => CartCubit(
      cartService: serviceLocator<CartService>(),
      loadCartUsecase: serviceLocator<LoadCartItemsUsecase>(),
      saveCartUsecase: serviceLocator<SaveCartItemUsecase>()));
  serviceLocator
      .registerFactory(() => HomeCubit(mockupProducts: MockupFixedProducts()));
  //! ############################### Services && Applications ###############################
  serviceLocator.registerLazySingleton<CartService>(() => CartService());
  //! ############################### Mockups ###############################
  serviceLocator.registerLazySingleton<MockupProducts>(
      () => serviceLocator<MockupFixedProducts>());
}
