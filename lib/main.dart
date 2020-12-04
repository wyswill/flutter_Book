/*
 * @LastEditors: wyswill
 * @Description: 文件描述
 * @Date: 2020-12-04 15:49:24
 * @LastEditTime: 2020-12-04 16:44:58
 */
import 'package:book/pages/serch.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '桃酥搜书',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SearchPage(),
    );
  }
}
