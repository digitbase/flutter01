import 'package:flutter/material.dart';
import "package:provide/provide.dart";
import '../provide/counter.dart';
import 'package:flutter_screenutil/screenutil.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member'),
      ),
      body: ListView(
        children: [
          _topHeader(),
          _orderTitle(),
          _orderType(),
          actionList(),
        ],
      ),
    );
  }

  Widget _topHeader() {
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all(10),
      color: Colors.pinkAccent,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: CircleAvatar(
              radius: ScreenUtil().setWidth(100),
              backgroundImage: NetworkImage(
                "https://pics3.baidu.com/feed/b8014a90f603738dd7b1a0fbddfd3156fa19ec5a.jpeg?token=18b3956adf0d98ac6f93fbcd1e71dc48",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              'ddd',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(36),
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _orderTitle() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12,
          ),
        ),
      ),
      child: ListTile(
        leading: Icon(Icons.list),
        title: Text('我的订单'),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  Widget _orderType() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(150),
      padding: EdgeInsets.only(top: 20),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Column(
              children: [
                Icon(
                  Icons.party_mode,
                  size: 30,
                ),
                Text('待付款',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(30),
                    )),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Icon(
                  Icons.query_builder,
                  size: 30,
                ),
                Text('待发货',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(30),
                    )),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Icon(
                  Icons.directions_car,
                  size: 30,
                ),
                Text('待收货',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(30),
                    )),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Icon(
                  Icons.comment,
                  size: 30,
                ),
                Text('待评价',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(30),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _myList(title) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
            bottom: BorderSide(
          width: 0.5,
          color: Colors.black38,
        )),
      ),
      child: ListTile(
        leading: Icon(Icons.bluetooth_connected_sharp),
        title: Text(title),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  Widget actionList() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          _myList('优惠劵'),
          _myList('已优惠劵'),
          _myList('地址管理'),
          _myList('客户电话'),
        ],
      ),
    );
  }
}
