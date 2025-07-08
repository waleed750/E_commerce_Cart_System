import '../../../../core/services/cache/app_prefs.dart';

abstract class SplashLocalDatasource {
  /// Saves the user's geolocation.
  Future<bool> saveonBoarding();

  Future<bool> isOnBoarding();
}

class SplashLocalDatasourceImpl implements SplashLocalDatasource {
  final AppPreferences _preferences;

  SplashLocalDatasourceImpl(this._preferences);

  @override
  Future<bool> saveonBoarding() async {
    await _preferences.setOnBoarding(true);
    return true;
  }

  @override
  Future<bool> isOnBoarding() async {
    return _preferences.getOnBoarding();
  }
}
