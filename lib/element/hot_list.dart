import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter01/element/lib_element.dart';
import 'package:flutter01/pages/lib_pages.dart';
import 'package:flutter01/service/service_method.dart';
import '../routers/application.dart';

class HotList extends StatefulWidget {
  @override
  _HotListState createState() => _HotListState();
}

class _HotListState extends State<HotList> {
  int pageNum = 1;
  List goodsList = [];
  List<Widget> listWidget = [];

  void initState() {
    super.initState();
    request(
      url: "homePageBelowConten",
      data: {'page': pageNum},
    ).then((val) {
      RLogger.instance.d('homePageBelowConten', tag: '访问');
      var data = jsonDecode(val.toString());
      List newGoodsList = data['data'];
      setState(() {
        goodsList.addAll(newGoodsList);
        pageNum++;
      });
    });
  }

  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    alignment: Alignment.centerLeft,
    color: Colors.transparent,
    child: Text('火爆专区'),
  );

  Widget _wrapList() {
    if (goodsList.length < 1) return null;
    listWidget = goodsList.map((val) {
      //RLogger.instance.d("message");
      return InkWell(
        onTap: () {
          Application.router.navigateTo(
            context,
            '/detail?id=${val['goodsId']}',
          );
        },
        child: Container(
          width: ScreenUtil().setWidth(372),
          margin: EdgeInsets.only(bottom: 3),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Image.network(
                val['image'],
                width: ScreenUtil().setWidth(370),
              ),
              Text(
                val['name'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: ScreenUtil().setSp(26),
                ),
              ),
              Row(
                children: <Widget>[
                  Text(r'$' + val['mallPrice'].toString()),
                  Text('')
                ],
              ),
            ],
          ),
        ),
      );
    }).toList();

    return Wrap(
      spacing: 2,
      children: listWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          hotTitle,
          _wrapList(),
        ],
      ),
    );
  }
}
