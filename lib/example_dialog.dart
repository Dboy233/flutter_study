import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///弹窗示例
class ExampleDialog {
  static Widget getDialog(context, isAndroid) {
    return isAndroid
        ? materialAlertDialog(context)
        : cupertinoAlertDialog(context);
  }

  /// Android平台样式 dialog
  static AlertDialog materialAlertDialog(context) {
    return AlertDialog(
      title: Text(
        "Material Dialog",
        textDirection: TextDirection.ltr,
      ),
      content: Text(
        "这是Android样式的弹窗",
        textDirection: TextDirection.ltr,
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            "Cancel",
            textDirection: TextDirection.ltr,
          ),
          onPressed: () {
            Navigator.of(context).pop("cancel");
          },
        ),
        FlatButton(
          child: Text(
            "Ok",
            textDirection: TextDirection.ltr,
          ),
          onPressed: () {
            Navigator.of(context).pop("ok");
          },
        ),
      ],
    );
  }

  ///IOS平台样式的dialog
  static CupertinoAlertDialog cupertinoAlertDialog(context) {
    return CupertinoAlertDialog(
      title: Text(
        "Cupertino Dialog",
        textDirection: TextDirection.ltr,
      ),
      content: Text(
        "这是IOS样式的弹窗",
        textDirection: TextDirection.ltr,
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(
            "Cancel",
            textDirection: TextDirection.ltr,
          ),
          onPressed: () {
            Navigator.of(context).pop("cancel");
          },
        ),
        CupertinoDialogAction(
          child: Text(
            "Ok",
            textDirection: TextDirection.ltr,
          ),
          onPressed: () {
            Navigator.of(context).pop("ok");
          },
        ),
      ],
    );
  }
}
