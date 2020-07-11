import 'package:flutter/material.dart';
import 'package:flutter_study/example_buttom.dart';
import 'package:flutter_study/example_pager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExamplePager(),
      routes: {
        "/exampleButton": (_) => ExampleButton(),
      },
    );
  }
}
