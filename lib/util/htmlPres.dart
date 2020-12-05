/*
 * @LastEditors: wyswill
 * @Description: html提取
 * @Date: 2020-12-04 19:53:21
 * @LastEditTime: 2020-12-05 18:08:28
 */
import "package:html/parser.dart" show parse;

List<Map<String, String>> getUrlAndContent(String htmlStr, String matchStr) {
  var document = parse(htmlStr);
  List aList = document.querySelectorAll(matchStr);
  List<Map<String, String>> ret = [];
  aList.forEach((element) {
    ret.add({"url": element.attributes['href'], "content": element.innerHtml});
  });
  return ret;
}

String bookContent(String htmlStr) {
  var document = parse(htmlStr);
  document.querySelector('#content p').innerHtml = '';
  dynamic content = document.querySelector('#content');
  return content.outerHtml;
}
