import 'core/core_export.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void restartApp(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(locale);
    state?.restartApp();
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  Key key = UniqueKey();

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: MaterialApp.router(
        scrollBehavior: AppScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        routerConfig: appRouter,
      ),
    );
  }
}
