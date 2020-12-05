/*
 * @LastEditors: wyswill
 * @Description: 调度页面
 * @Date: 2020-12-05 18:13:03
 * @LastEditTime: 2020-12-05 18:19:40
 */

import 'package:book/pages/bookMark.dart';
import 'package:book/pages/bookshelf.dart';
import 'package:book/pages/history.dart';
import 'package:book/pages/serch.dart';
import 'package:flutter/material.dart';

class Dispatch extends StatefulWidget {
  Dispatch({Key key}) : super(key: key);
  @override
  _DispatchState createState() => _DispatchState();
}

class _DispatchState extends State<Dispatch> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [BookShelf(), SearchPage(), HistoryPage(), BookMark()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: switchPage,
        items: [
          BottomNavigationBarItem(label: '书架', icon: Icon(Icons.table_chart)),
          BottomNavigationBarItem(label: '搜书', icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: '历史', icon: Icon(Icons.history)),
          BottomNavigationBarItem(
              label: '收藏夹', icon: Icon(Icons.collections_bookmark)),
        ],
      ),
    );
  }

  switchPage(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
