import 'package:flutter/material.dart';
import 'package:flutter01/pages/lib_pages.dart';

class Recommend extends StatelessWidget {
  final List recommendList;

  Recommend({this.recommendList});

  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.black12,
          ),
        ),
      ),
      child: Text(
        '商品推荐',
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

  Widget _item(index) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil().setHeight(180),
        width: ScreenUtil().setWidth(180),
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['image']),
            Text(r"$" + recommendList[index]['mallPrice'].toString()),
          ],
        ),
      ),
    );
  }

  Widget _recommendList() {
    return Container(
      height: ScreenUtil().setHeight(200),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context, index) {
          return _item(index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommendList(),
        ],
      ),
    );
  }
}
