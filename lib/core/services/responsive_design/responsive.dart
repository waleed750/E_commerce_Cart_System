// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  // This isMobile, isTablet, isDesktop helep us later
  static int mobile_width = 700;
  static int tablet_width = 1100;
  static int desktop_width = 1400;
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobile_width;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < tablet_width &&
      MediaQuery.of(context).size.width >= mobile_width;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tablet_width;
  static Size get minimumWindowSize => const Size(400,650); 
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // If our width is more than 1100 then we consider it a desktop
    if (size.width >= tablet_width) {
      return desktop;
    }
    // If width it less then 1100 and more then 810 we consider it as tablet
    else if (size.width >= mobile_width && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}