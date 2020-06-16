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

Future request({url, formData = null, method = 'post'}) async {
  try {
    print('servic_method.dar。。。。。。');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse('application/x-www-form-urlencoded').toString();

    print('访问：${servicePath[url]} 接口');

    if (method == 'post') {
      if (formData == null)
        response = await dio.post(servicePath[url]);
      else
        response = await dio.post(servicePath[url], data: formData);
    } else {
      String para = "";
      if (formData != null) {
        for (int me = 0; me < formData.keys.toList().length; me++) {
          para += formData.keys.toList()[me] +
              "=" +
              formData[formData.keys.toList()[me]] +
              "&";
        }
      }
      String getUrl = servicePath[url] + "?" + para;
      print(getUrl);
      response = await dio.get(getUrl);
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常');
    }
  } catch (e) {
    return print('Error:=======${e}==============');
  }
}
