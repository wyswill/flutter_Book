/*
 * @LastEditors: wyswill
 * @Description: 书内容
 * @Date: 2020-12-04 20:13:57
 * @LastEditTime: 2020-12-05 17:52:31
 */

import 'package:book/util/htmlPres.dart';
import 'package:book/util/request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class BookContent extends StatefulWidget {
  BookContent({Key key, this.bookInfo}) : super(key: key);
  final Map<String, String> bookInfo;
  @override
  _BookContentState createState() => _BookContentState();
}

class _BookContentState extends State<BookContent> {
  String content = '';

  @override
  void initState() {
    super.initState();
    getBookInfo(widget.bookInfo['url']).then((value) {
      setState(() {
        content = bookContent(value.data);
      });
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
        body: SingleChildScrollView(
          child: HtmlWidget(
            content,
            textStyle: TextStyle(fontSize: 14),
            customStylesBuilder: (element) {
              if (element.attributes['align'] == 'center')
                return {'display': 'none'};
              return {"margin": "20px 14px"};
            },
            webView: true,
          ),
        )); //斗罗
  }
}
