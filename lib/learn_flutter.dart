import 'package:flutter/material.dart';

void main() => runApp(LearnFlutter());

class LearnFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Learn Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: new AppBar(
          title: new Text("Learn Flutter"),
        ),
        body: ListViewDemo(),
      ),
    );
  }
}


/// 动态更新listview数据
class ListViewDemo extends StatefulWidget {
  ListViewDemo({Key key}) : super(key: key);

  @override
  _ListViewDemoState createState() => new _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  ///list数据
  List<String> data = [];

  @override
  void initState() {
    super.initState();
    //初始化数据列表
    for (int i = 0; i < 10; i++) {
      data.add("我是第 $i 行");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length, //设置list的长度
        itemBuilder: (BuildContext context, int position) {
          //根据上面的itemCount 获取对应位置的组件 {position=0~itemCount}
          return getRow(position);
        });
  }

  Widget getRow(int i) {
    return GestureDetector(
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: new Text(
            "${data[i]}", //设置数据
            textDirection: TextDirection.ltr,
          )),
      onTap: () {
        setState(() {
          //点击任意item 向list数据中增加一个数据
          data.add("我是增加的数据 ${data.length}");
        });
      },
    );
  }
}
/// 动态更新listview数据 ↑↑↑↑↑

/// 有状态组件赋值代码 ↓↓↓↓
class StatefulDemo extends StatefulWidget {
  @override
  _StatefulDemoState createState() => _StatefulDemoState();
}

class _StatefulDemoState extends State<StatefulDemo> {
  var size = 0;

  ///初始化变量的参数 text展示的值就是初始化后的值
  @override
  void initState() {
    size = 10;
    super.initState();
  }

  ///累加数值
  _plusSize() {
    //将赋值代码使用setState包裹
    setState(() {
      size++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            "$size", //显示数字
            textDirection: TextDirection.ltr,
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              //触发点击事件
              _plusSize();
            }),
      ),
    );
  }
}
/// 有状态组件赋值代码 ↑↑↑


///  flutter 无状态组件基本写法 ↓↓
class StatelessDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Text(
          "flutter",
          textDirection: TextDirection.ltr,
        )),
      ),
    );
  }
}
/// flutter 无状态组件基本写法 ↑↑



///flutter 代码基本结构  ↓↓↓↓
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
///flutter 代码基本结构  ↑↑↑↑
