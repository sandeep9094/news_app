import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/constants/string_const.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  Size get screenSize => MediaQuery.sizeOf(this);

  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  EdgeInsets get screenPadding => MediaQuery.paddingOf(this);

  TextScaler get screenTextScaleFactor => MediaQuery.textScalerOf(this);

  bool get isSmallScreen => screenSize.width < 800;

  bool get isMediumScreen => screenSize.width >= 800 && screenSize.width <= 1200;

  bool get isLargeScreen => screenSize.width > 800 && !isMediumScreen;

  bool get isPlatformDarkThemed => MediaQuery.platformBrightnessOf(this) == Brightness.dark;

  void showSnackBar(String text) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  double getVariableScreenHeight(double percentage) {
    return screenHeight * (percentage * (1 / 100));
  }

  double getVariableScreenWidth(double percentage) {
    return screenWidth * (percentage * (1 / 100));
  }

  void showSnackBarAsync(String text) {
    if (mounted) {
      showSnackBar(text);
    }
  }

  void navigateToScreen(Widget screen, {String routeName = ""}) {
    if (routeName.isEmpty) {
      Navigator.of(this).push(MaterialPageRoute(builder: (context) => screen));
    } else {
      Navigator.of(this).push(MaterialPageRoute(
        builder: (context) => screen,
        settings: RouteSettings(name: routeName),
      ));
    }
  }

  Future<dynamic> navigateToScreenWithResult(Widget screen) async {
    return Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  void navigateToReplacement(Widget screen) {
    Navigator.pushReplacement(this, MaterialPageRoute(builder: (context) => screen));
  }

  void popScreen() {
    Navigator.of(this).pop();
  }

  void popScreenUntil({String routeName = ""}) {
    if (routeName.isNotEmpty) {
      Navigator.of(this).popUntil(ModalRoute.withName(routeName));
    } else {
      Navigator.of(this).popUntil((route) => route.isFirst);
    }
  }

  void navigateToScreenAndClearStack(Widget screen) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => screen),
      (r) => false,
    );
  }

  Color? setLightColor(Color color) {
    return Theme.of(this).brightness == Brightness.light ? color : null;
  }

  Color? setDarkColor(Color color) {
    return Theme.of(this).brightness == Brightness.dark ? color : null;
  }

  Color setBothThemeColor(Color lightModeColor, Color darkModeColor) {
    return Theme.of(this).brightness == Brightness.light ? lightModeColor : darkModeColor;
  }


  void showSuccessFlushBar(String? message, {flusbarPosition = FlushbarPosition.BOTTOM}) {
    showFlushbar(
      context: this,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        padding: const EdgeInsets.all(15),
        message: message ?? StringConstant.SOMETHING_WENT_WRONG,
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: flusbarPosition,
        backgroundColor: Colors.green,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(
          Icons.check_circle,
          size: 28,
          color: Colors.white,
        ),
      )..show(this),
    );
  }

  void showErrorFlushBar(String? message, {flusbarPosition = FlushbarPosition.BOTTOM}) {
    if(!mounted){
      return;
    }
    showFlushbar(
      context: this,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        padding: const EdgeInsets.all(15),
        message: message ?? StringConstant.SOMETHING_WENT_WRONG,
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: flusbarPosition,
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(
          Icons.error,
          size: 28,
          color: Colors.white,
        ),
      )..show(this),
    );
  }


  Future<void> launchUrlIntent(String url) async {
    final urlUri = Uri.parse(url);
    if (await canLaunchUrl(urlUri)) {
      await launchUrl(urlUri);
    } else {
      throw Exception('Could not launch URL: $url');
    }
  }


}
