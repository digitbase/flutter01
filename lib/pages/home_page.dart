import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter01/element/ad_phone.dart';
import 'package:flutter01/element/hot_list.dart';
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
    String log = ("设置像素密度：" + ScreenUtil.pixelRatio.toString());
    log += ("设置高：" + ScreenUtil.screenHeight.toString());
    log += ("设置宽：" + ScreenUtil.screenWidth.toString());
    //RLogger.instance.d(log, tag: 'new tag');

    return Scaffold(
      appBar: AppBar(
        title: Text('美好人间'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getHomePageContext(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = jsonDecode(snapshot.data);

              List swiper = (data['data']['slides']);
              List navigatorList = (data['data']['category']);
              String leaderImage = data['data']['shopInfo']['leaderImage'];
              String leaderPhone = data['data']['shopInfo']['leaderPhone'];
              List recommendList = data['data']['recommend'];
              List floor1 = data['data']['floor1'];
              List floor2 = data['data']['floor2'];
              List floor3 = data['data']['floor3'];

              //print(recommendList[0].toString());
              return Column(
                children: <Widget>[
                  SwiperDiy(
                      swiperDataList: swiper,
                      setHight: ScreenUtil().setHeight(275)),
                  // TopNavigator(navigatorList: navigatorList),
                  // LeaderPhone(
                  //     leaderPhone: leaderPhone, leaderImage: leaderImage),
                  // Recommend(recommendList: recommendList),
                  // FloorContent(flooderGoodsList: floor1),
                  // FloorContent(flooderGoodsList: floor2),
                  // FloorContent(flooderGoodsList: floor3),
                  HotList(),
                ],
              );
            } else {
              return Text('error!');
            }
          },
        ),
      ),
    );
  }
}
