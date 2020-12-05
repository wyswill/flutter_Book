/*
 * @LastEditors: wyswill
 * @Description: 书架
 * @Date: 2020-12-05 18:16:12
 * @LastEditTime: 2020-12-05 18:20:51
 */
import 'package:flutter/material.dart';

class BookShelf extends StatefulWidget {
  BookShelf({Key key}) : super(key: key);

  @override
  _BookShelfState createState() => _BookShelfState();
}

class _BookShelfState extends State<BookShelf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('书架'),
      ),
      body: Container(
        child: Text('书架'),
      ),
    );
  }
}
