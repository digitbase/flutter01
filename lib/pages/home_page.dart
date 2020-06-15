import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter01/element/ad_phone.dart';
import 'package:flutter01/element/lib_element.dart';
import 'package:flutter01/service/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;
  TextEditingController textContorl = TextEditingController();
  String selectText = "你好您选择的是";

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    print("设置像素密度：" + ScreenUtil.pixelRatio.toString());
    print("设置高：" + ScreenUtil.screenHeight.toString());
    print("设置宽：" + ScreenUtil.screenWidth.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('美好人间'),
      ),
      body: FutureBuilder(
        future: getHomePageContext(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = jsonDecode(snapshot.data);
            List swiper = (data['data']['slides']);
            List navigatorList = (data['data']['category']);
            String leaderImage = data['data']['shopInfo']['leaderImage'];
            String leaderPhone = data['data']['shopInfo']['leaderPhone'];
            List recommendList = data['data']['recommend'];

            print(recommendList[0].toString());
            return Column(
              children: <Widget>[
                SwiperDiy(
                  swiperDataList: swiper,
                  setHight: ScreenUtil().setHeight(275),
                ),
                TopNavigator(
                  navigatorList: navigatorList,
                ),
                LeaderPhone(
                  leaderPhone: leaderPhone,
                  leaderImage: leaderImage,
                ),
                Recommend(
                  recommendList: recommendList,
                ),
              ],
            );
          } else {
            return Text('error!');
          }
        },
      ),
    );
  }

  void _choiceAction(context) {
    print('start select.............');
    if (textContorl.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text('美女不能为空')),
      );
    } else {
      getHttp(textContorl.text.trim()).then(
        (value) => {
          setState(() {
            Map a = jsonDecode(value);

            print(a['data'].toString());
            if (a['data'].toString() == "[]") {
              selectText = "没有数据";
            } else {
              selectText = a['data'][0]['root'].toString();
            }
          })
        },
      );
    }
  }

  Future getHttp(String typeText) async {
    try {
      var data = {'word': typeText};
      Response response = await Dio().get(
        "https://s.ohltr.com/searchapi.php",
        queryParameters: data,
        options: RequestOptions(),
      );
      //print(response.data);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
