/*
 * @LastEditors: wyswill
 * @Description: 书目录
 * @Date: 2020-12-04 19:39:09
 * @LastEditTime: 2020-12-05 17:52:21
 */

import 'package:book/pages/bookContent.dart';
import 'package:book/util/htmlPres.dart';
import 'package:book/util/request.dart';
import 'package:flutter/material.dart';

class BookDetil extends StatefulWidget {
  BookDetil({Key key, this.bookInfo}) : super(key: key);
  final Map<String, String> bookInfo;
  @override
  _BookDetilState createState() => _BookDetilState();
}

class _BookDetilState extends State<BookDetil> {
  List<Map<String, String>> allDatas = [], newData = [];

  @override
  void initState() {
    super.initState();
    getBookInfo(widget.bookInfo['url']).then((value) {
      setState(() {
        List<Map<String, String>> temp =
            getUrlAndContent(value.data, '#list dd a');
        allDatas = temp.sublist(12, temp.length);
        newData = temp.sublist(0, 12);
      }); //酒神
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.bookInfo['content']),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Text(
                      '《${widget.bookInfo["content"]}》最新章节',
                      style: TextStyle(color: Colors.red),
                    ),
                childCount: 1),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                      onTap: () {
                        jump(this.newData[index]);
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text('${this.newData[index]['content']}'),
                      ),
                    ),
                childCount: this.newData.length),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Text(
                      '《${widget.bookInfo["content"]}》全部章节',
                      style: TextStyle(color: Colors.red),
                    ),
                childCount: 1),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                      onTap: () {
                        jump(this.allDatas[index]);
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text('${this.allDatas[index]['content']}'),
                      ),
                    ),
                childCount: this.allDatas.length),
          )
        ],
      ),
    );
  }

  void jump(Map<String, String> allData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookContent(
          bookInfo: allData,
        ),
      ),
    );
  }
}
