/*
 * @LastEditors: wyswill
 * @Description: 书签
 * @Date: 2020-12-05 18:18:54
 * @LastEditTime: 2020-12-05 18:19:27
 */

import 'package:flutter/material.dart';

class BookMark extends StatefulWidget {
  BookMark({Key key}) : super(key: key);

  @override
  _BookMarkState createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text('书签'),
      ),
    );
  }
}
