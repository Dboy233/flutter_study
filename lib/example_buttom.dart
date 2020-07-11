import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_study/example_dialog.dart';
import 'package:flutter_study/toast_util.dart';

class ExampleButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ///显示弹窗
      _showDialog(isAndroid) async {
      var data;
      if (isAndroid) {
        data = await showDialog(
            context: context,
            ///点击其他区域隐藏
            barrierDismissible: true,
            child: ExampleDialog.getDialog(context, isAndroid));
      } else {
        data = await showCupertinoDialog(
            context: context,
            builder: (context) {
              return ExampleDialog.getDialog(context, false);
            });
      }
      if (data != null) {
        Toast.toast(context,
            msg: data, position: ToastPosition.bottom, bgColor: Colors.black12);
      }
    }

    return Container(
      color: Colors.cyanAccent,
      child: MaterialApp(
        theme: ThemeData(buttonTheme: ButtonThemeData()),
        home: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context, "从上个页面返回");
                },
                child: Icon(Icons.arrow_back_ios)),
            elevation: 4,
          ),
          body: Container(
            color: Colors.black12,

            ///控件中心对齐
            child: Center(

              ///一列
              child: Column(

                ///主轴方向，中心点剧中
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      _showDialog(true);
                    },
                    child: Text(
                      "Material ShowDialog",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 0,
                    height: 50,
                  ),
                  CupertinoButton(
                    child: Text(
                      "Cupertino ShowDialog",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      _showDialog(false);
                    },
                    color: Colors.grey[350],
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context, "从上个页面返回");
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
      ),
    );
  }


}


