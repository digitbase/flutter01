import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloorContent extends StatelessWidget {
  final List flooderGoodsList;

  FloorContent({this.flooderGoodsList});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _firstRow(),
          _otherGoods(),
        ],
      ),
    );
  }

  Widget _firstRow() {
    return Row(
      children: <Widget>[
        _goodsItme(flooderGoodsList[0]),
        Column(
          children: <Widget>[
            _goodsItme(flooderGoodsList[1]),
            _goodsItme(flooderGoodsList[2]),
          ],
        ),
      ],
    );
  }

  Widget _otherGoods() {
    return Row(
      children: <Widget>[
        _goodsItme(flooderGoodsList[3]),
        _goodsItme(flooderGoodsList[4]),
      ],
    );
  }

  Widget _goodsItme(Map goods) {
    return Container(
      width: ScreenUtil().setWidth(375),
      //height: ScreenUtil().setHeight(400),
      child: InkWell(
        onTap: () {
          print('点击了楼层商品');
        },
        child: Stack(
          children: <Widget>[
            Image.network(goods['image']),
            Positioned(
              top: 10,
              left: 10,
              child: Text('test'),
            ),
          ],
        ),
      ),
    );
  }
}
