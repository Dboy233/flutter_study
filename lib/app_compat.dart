import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompatPagerRouter {
  static PageRoute router(
      {@required WidgetBuilder builder,
      String title,
      RouteSettings settings,
      bool maintainState = true,
      bool fullscreenDialog = false}) {
    if (_isIOS()) {
      return CupertinoPageRoute(
          builder: builder,
          title: title,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog);
    } else {
      return MaterialPageRoute(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog);
    }
  }

  static bool _isIOS() {
    return Platform.isIOS;
  }
}
