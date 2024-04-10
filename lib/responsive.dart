import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key key,
     this.mobile,
     this.tablet,
     this.desktop,
  }) : super(key: key);

// This size work fine on my design, maybe you need some customization depends on your design

  static bool isMobilee(BuildContext context) =>
      MediaQuery.of(context).size.width < 550;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 750;

  static bool car(BuildContext context) =>
      MediaQuery.of(context).size.width < 1000;

  static bool carr(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100;


  static bool carrr(BuildContext context) =>
      MediaQuery.of(context).size.width < 1000;




  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 770 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 770;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // If our width is more than 900 then we consider it a desktop
      builder: (context, constraints) {
        if (constraints.maxWidth >= 770) {
          return desktop;
        }
        // If width it less then 900 and more then 650 we consider it as tablet
        else if (constraints.maxWidth >= 650) {
          return tablet;
        }
        // Or less then that we called it mobile
        else {
          return mobile;
        }
      },
    );
  }
}
