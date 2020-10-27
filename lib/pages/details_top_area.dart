import 'package:flutter/material.dart';
import 'package:flutter01/provide/gooddetail_pvd.dart';
import 'package:provide/provide.dart';
import '../provide/details_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'detail_tabbar.dart';
import 'detail_web.dart';
import 'details_bottom.dart';

class DetailsTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<GoodDetailProvide>(
      builder: (context, child, val) {
        var goodsInfo = Provide.value<GoodDetailProvide>(context).goodsInfo;

        return Stack(
          children: [
            Container(
              child: ListView(
                children: [
                  _goodsImage(goodsInfo.data.goodInfo.image1),
                  _goodsName(goodsInfo.data.goodInfo.goodsName),
                  _goodsNum(goodsInfo.data.goodInfo.presentPrice.toString()),
                  DetailsTabbar(),
                  DateailWeb(),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: DetailsBottom(),
            )
          ],
        );
      },
    );
  }

  Widget _goodsImage(url) {
    return Image.network(
      url,
      width: ScreenUtil().setWidth(740),
    );
  }

  Widget _goodsName(name) {
    return Container(
      child: Text(name,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(30),
          )),
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15.0),
    );
  }

  Widget _goodsNum(num) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Text('编号:' + num,
          style: TextStyle(
            color: Colors.black12,
          )),
    );
  }
}
