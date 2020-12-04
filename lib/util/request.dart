/*
 * @LastEditors: wyswill
 * @Description: 网络请求
 * @Date: 2020-12-04 16:35:40
 * @LastEditTime: 2020-12-04 19:48:59
 */

import 'package:dio/dio.dart';

Dio dio =
    Dio(BaseOptions(baseUrl: 'https://www.biqugexx.com', sendTimeout: 5000));
Future<Response<String>> searchFunc(String name) async {
  return await dio.request(
    '/index.php?s=/web/index/search',
    options: Options(
      method: "POST",
      contentType: "application/x-www-form-urlencoded",
    ),
    data: {"name": name},
  );
}

Future<Response<String>> getBookInfo(String path) {
  return dio.request(path);
}
