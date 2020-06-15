import 'package:dio/dio.dart';
import "dart:io";
import "../config/service_url.dart";

Future getHomePageContext() async {
  try {
    print('servic_method.dar。。。。。。');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse('application/x-www-form-urlencoded').toString();
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    response = await dio.post(servicePath['homePageContent'], data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常');
    }
  } catch (e) {
    return print('Error:=======${e}==============');
  }
}