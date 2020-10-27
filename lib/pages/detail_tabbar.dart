import 'package:flutter/material.dart';
import 'package:flutter01/provide/gooddetail_pvd.dart';
import 'package:provide/provide.dart';
import '../provide/details_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsTabbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DetailInfoProvide>(
      builder: (context, chail, val) {
        return Container(
          child: Row(
            children: [
              _myTabbarLeft(
                  context, Provide.value<DetailInfoProvide>(context).isLeft),
              _myTabbarRight(
                  context, Provide.value<DetailInfoProvide>(context).isLeft),
            ],
          ),
        );
      },
    );
  }

  Widget _myTabbarLeft(BuildContext context, bool isLeft) {
    return InkWell(
      onTap: () {
        Provide.value<DetailInfoProvide>(context).changeLeft('left');
      },
      child: Container(
        child: Text(
          "详情",
          style: TextStyle(
            color: isLeft ? Colors.pink : Colors.black,
          ),
        ),
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(375),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
            width: 1.0,
            color: isLeft ? Colors.pink : Colors.black12,
          )),
        ),
      ),
    );
  }

  Widget _myTabbarRight(BuildContext context, bool isLeft) {
    return InkWell(
      onTap: () {
        Provide.value<DetailInfoProvide>(context).changeLeft('right');
      },
      child: Container(
        child: Text(
          "评论",
          style: TextStyle(
            color: isLeft ? Colors.black : Colors.pink,
          ),
        ),
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(375),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
            width: 1.0,
            color: isLeft ? Colors.black12 : Colors.pink,
          )),
        ),
      ),
    );
  }
}
