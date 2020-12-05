/*
 * @LastEditors: wyswill
 * @Description: 历史记录
 * @Date: 2020-12-05 18:17:17
 * @LastEditTime: 2020-12-05 18:18:10
 */
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text('历史记录'),
      ),
    );
  }
}
