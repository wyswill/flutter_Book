/*
 * @LastEditors: wyswill
 * @Description: 文件描述
 * @Date: 2020-12-04 16:43:53
 * @LastEditTime: 2020-12-05 18:20:25
 */
import 'package:book/pages/bookDetil.dart';
import 'package:book/util/htmlPres.dart';
import 'package:book/util/request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();
  List<Map<String, String>> serchRess = [];
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜书'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Row(
                  children: [
                    Expanded(
                      child: TextField(
                        focusNode: focusNode,
                        controller: controller,
                        decoration: InputDecoration(),
                      ),
                    ),
                    FlatButton(onPressed: searchAction, child: Text('搜书'))
                  ],
                );
              },
              childCount: 1,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                      onTap: () {
                        jump(this.serchRess[index]);
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text('${this.serchRess[index]['content']}'),
                      ),
                    ),
                childCount: this.serchRess.length),
          )
        ],
      ),
    );
  }

  searchAction() async {
    String serchWord = controller.text;
    if (serchWord != '') {
      setState(() {
        this.serchRess = [];
      });
      Response<String> res = await searchFunc(serchWord);
      this.serchRess = getUrlAndContent(res.data, '.novelslist2 li .s2 a');
      setState(() {});
      //斗罗大陆
    }
  }

  jump(Map<String, String> item) {
    controller.clear();
    focusNode.unfocus();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetil(
          bookInfo: item,
        ),
      ),
    );
  }
}
