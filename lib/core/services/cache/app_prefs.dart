// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../features/cart/data/models/product_model.dart';
import '../../core_export.dart';

class AppPrefKey {
  static const String isOnBoarding = 'isOnBoarding';
  static const String cart = 'cart';
}

class AppPreferences {
  static FlutterSecureStorage? _storage;

  AppPreferences();

  // Initializes the secure storage with platform-specific options.
  Future<void> init() async {
    final androidOptions = AndroidOptions(
        encryptedSharedPreferences: true,
        resetOnError: true,
        keyCipherAlgorithm: _toKeyCipher,
        storageCipherAlgorithm: _toStorageCipher,
        preferencesKeyPrefix: String.fromEnvironment(Environment.KY_PREFIX));

    const iosOptions = IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
      synchronizable: true,
    );
    _storage = FlutterSecureStorage(
      aOptions: androidOptions,
      iOptions: iosOptions,
    );
  }

  // Storage Cipher Algorithm options
  static StorageCipherAlgorithm get _toStorageCipher {
    switch (String.fromEnvironment(Environment.KY_CIPHER)) {
      case 'AES_CBC_PKCS7Padding':
        return StorageCipherAlgorithm.AES_CBC_PKCS7Padding;
      case 'AES_GCM_NoPadding':
        return StorageCipherAlgorithm.AES_GCM_NoPadding;
      default:
        return StorageCipherAlgorithm.AES_CBC_PKCS7Padding;
    }
  }

  // Key Cipher Algorithm options
  static KeyCipherAlgorithm get _toKeyCipher {
    switch (String.fromEnvironment(Environment.KY_CIPHER)) {
      case 'AES_CBC_PKCS7Padding':
        return KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding;
      case 'AES_GCM_NoPadding':
        return KeyCipherAlgorithm.RSA_ECB_PKCS1Padding;
      default:
        return KeyCipherAlgorithm.RSA_ECB_PKCS1Padding;
    }
  }

  // Saves the onBoarding state.
  Future<void> setOnBoarding(bool value) async {
    await _storage?.write(
      key: AppPrefKey.isOnBoarding,
      value: jsonEncode(value),
    );
  }

  // Retrieves the onBoarding state.
  Future<bool> getOnBoarding() async {
    final value = await _storage?.read(key: AppPrefKey.isOnBoarding);
    if (value == null) return false;
    return jsonDecode(value) as bool;
  }

  Future<void> setCart(List<ProductModel> cart) async {
    final cartJson = jsonEncode(cart.map((e) => e.toJson()).toList());
    await _storage?.write(key: AppPrefKey.cart, value: cartJson);
  }

  Future<List<ProductModel>> getCart() async {
    final cartJson = await _storage?.read(key: AppPrefKey.cart);
    if (cartJson == null) return <ProductModel>[];
    final List<dynamic> cartList = jsonDecode(cartJson);
    return cartList.map((e) => ProductModel.fromJson(e)).toList();
  }
}
