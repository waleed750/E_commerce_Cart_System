// ignore_for_file: constant_identifier_names

class Environment {
  //!App Id 
  static const APP_STORE_ID = String.fromEnvironment('APP_STORE_ID');
  //!Website keys 
  static const WEBSITE_LINK = String.fromEnvironment('WEBSITE_LINK');
  // Existing keys
  //!Back end 
  //* static const TOKEN_CONFIG = String.fromEnvironment('TOKEN_CONFIG');
  // local storage
  static const STORAGE = String.fromEnvironment('STORAGE');
  static const KY_CIPHER = String.fromEnvironment('KY_CIPHER');
  static const VA_CIPHER = String.fromEnvironment('VA_CIPHER');
  static const KY_PREFIX = String.fromEnvironment('KY_PREFIX');  
  // static const SUBSCRIPTION_MESSAGING = String.fromEnvironment('SUBSCRIPTION_MESSAGING');
  //!Notification
  static const NOTIFICATION_ONE_SIGNAL_ID = String.fromEnvironment('NOTIFICATION_ONE_SIGNAL_ID');
  //Security
  //?SigningCertHashes = "DyFsdawdqwd97878wq7d87q8wd"
  static const SigningCertHashes = String.fromEnvironment('SigningCertHashes');
  //**if we added Free rasp we will need to add watcher mail 
  static const WatcherMail = String.fromEnvironment('WatcherMail');
}