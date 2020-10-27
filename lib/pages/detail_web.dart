import 'package:flutter/material.dart';
import 'package:flutter01/provide/gooddetail_pvd.dart';
import 'package:provide/provide.dart';
import '../provide/details_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_html/flutter_html.dart';

class DateailWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goodsDetails = Provide.value<GoodDetailProvide>(context)
        .goodsInfo
        .data
        .goodInfo
        .goodsDetail;

    return Provide<DetailInfoProvide>(builder: (context, chail, val) {
      if (Provide.value<DetailInfoProvide>(context).isLeft) {
        return Container(
          child: Html(
            data: goodsDetails,
          ),
        );
      } else {
        return Container(
          child: Text('暂无数据'),
        );
      }
    });
  }
}
