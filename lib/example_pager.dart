import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ExamplePager extends StatefulWidget {
  @override
  _ExamplePagerState createState() => _ExamplePagerState();
}

class _ExamplePagerState extends State<ExamplePager> {
  ///初始化平台方法调用渠道
  static const platform = const MethodChannel("example.platform/nativeMethod");

  String des = "我是文本";

  ///获取原生的某些数据 通过调用原生方法
  Future _getAndroidValue() async {
    String value;
    try {
      value = await platform.invokeMethod("getBatteryLevel");
    } catch (e) {
      print(e);
      value = "获取失败";
    }
    setState(() {
      des = value;
    });
  }

  ///打开原生activity 通过调用原生方法
  Future _openExampleActivity() async {
    try {
      platform.invokeMethod("openExampleActivity");
    } catch (e) {
      print(e);
    }
  }

  /// 到flutter下个页面
  _navigatorNextPager() async {
    print("组件 => ${context.widget}");

    var data = await Navigator.pushNamed(context, "/exampleButton");

    if (data != null) {
      setState(() {
        des = data;
      });
    }
  }


  ///改变文字
  void _changeMsg(msg) {
    assert(msg != null);
    setState(() {
      des = msg;
    });
  }

  ///原生平台调用flutter 回调处理
  ///处理原生平台返回的数据
  ///此方法传递给MethodChannel.setMethodCallHandler(handler)
  Future _onMethodCall(MethodCall call) async {
    if (call.method == "changeMsg") {
      _changeMsg(call.arguments.toString());
    }else{
      ///其他方法调用处理
    }
  }

  @override
  void initState() {
    ///注册原生调用flutter回调
    platform.setMethodCallHandler(_onMethodCall);

//    ///注册原生调用flutter回调
//    platform.setMethodCallHandler( (call) async =>{
//      if (call.method=="changeMsg") {
//        _changeMsg(call.arguments.toString())
//      }
//    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              des,
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            SizedBox(
              height: 100,
            ),
            RaisedButton(
              onPressed: () {
                _getAndroidValue();
              },
              child: Text("调用原生方法,获取电池电量"),
            ),
            RaisedButton(
              onPressed: () {
                _openExampleActivity();
              },
              child: Text("打开原生Activity"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigatorNextPager();
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
