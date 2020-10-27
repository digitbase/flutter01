import 'package:dio/dio.dart';
import "dart:io";
import "../config/service_url.dart";
import '../element/r_log.dart';

Future getHomePageContext() async {
  try {
    print('servic_method.dar。。。。。。');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse('application/x-www-form-urlencoded').toString();
    var data = {'lon': '115.02932', 'lat': '35.76189'};
    response = await dio.post(servicePath['homePageContent'], data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常');
    }
  } catch (e) {
    return print('Error:=======${e}==============');
  }
}

Future request({url, data = null, method = 'post'}) async {
  try {
    print('=====================servicemethod.dar=================');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse('application/x-www-form-urlencoded').toString();

    print('request访问：${servicePath[url]} 接口');
    print('参数: ${data}');

    if (method == 'post') {
      if (data == null)
        response = await dio.post(servicePath[url]);
      else
        response = await dio.post(servicePath[url], data: data);
    } else {
      String para = "";
      if (data != null) {
        for (int me = 0; me < data.keys.toList().length; me++) {
          para +=
              data.keys.toList()[me] + "=" + data[data.keys.toList()[me]] + "&";
        }
      }
      String getUrl = servicePath[url] + "?" + para;
      response = await dio.get(getUrl);
    }

    if (response.statusCode == 200) {
      int sleng = response.data.toString().length;
      //RLogger.instance.d(response.data, tag: '==${url}==');
      print('=========================end=================');
      return response.data;
    } else {
      throw Exception('后端接口出现异常');
    }
  } catch (e) {
    return print('Error:=======${e}==============');
  }
}
