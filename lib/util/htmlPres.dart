/*
 * @LastEditors: wyswill
 * @Description: html提取
 * @Date: 2020-12-04 19:53:21
 * @LastEditTime: 2020-12-04 20:33:03
 */
import "package:html/parser.dart" show parse;

List<Map<String, String>> getUrlAndContent(String htmlStr, String matchStr) {
  var document = parse(htmlStr);
  List a_list = document.querySelectorAll(matchStr);
  List<Map<String, String>> ret = [];
  a_list.forEach((element) {
    ret.add({"url": element.attributes['href'], "content": element.innerHtml});
  });
  return ret;
}

String bookContent(String htmlStr) {
  var document = parse(htmlStr);
  dynamic content = document.querySelector('#content');
  return content.outerHtml;
}
