import 'package:flutter/material.dart';
import 'package:flutter01/provide/gooddetail_pvd.dart';
import 'package:provide/provide.dart';
import '../provide/details_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goodsInfo = Provide.value<DetailInfoProvide>(context).goodsInfo;

    return Container(
      //color: Colors.,
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(80),
      color: Colors.white,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              print('add goods');
            },
            child: Container(
              width: ScreenUtil().setWidth(110),
              alignment: Alignment.center,
              child: Icon(
                Icons.shopping_cart,
                size: 35,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              print('add2 buy');
            },
            child: Container(
              width: ScreenUtil().setWidth(320),
              alignment: Alignment.center,
              child: Text(
                "加入购物车",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(28),
                  color: Colors.white,
                ),
              ),
              color: Colors.green[500],
            ),
          ),
          InkWell(
            onTap: () {
              print('just buy');
            },
            child: Container(
              width: ScreenUtil().setWidth(320),
              alignment: Alignment.center,
              child: Text(
                "立即购买",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(28),
                  color: Colors.white,
                ),
              ),
              color: Colors.red[500],
            ),
          ),
        ],
      ),
    );
  }
}
