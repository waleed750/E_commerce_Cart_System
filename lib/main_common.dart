// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';

import '../core/core_export.dart';
import 'my_app.dart';

Future<void> mainCommon() async {
  // This can be useful for catching errors that might occur during the execution of the code inside the zone.
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      // prevent landscape mode
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      // init service locator

      await initServiceLocator();

      runApp(const MyApp());
    },
    (error, stackTrace) {
      //! If an error occurs the provided error handler
      //! will be called with the error and possibly a stack trace.
      log('runZonedGuarded: Caught error in my root zone. Error: $error, StackTrace: $stackTrace');
    },
  );
}
