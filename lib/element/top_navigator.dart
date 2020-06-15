import 'package:flutter/material.dart';
import 'package:flutter01/pages/lib_pages.dart';

class TopNavigator extends StatelessWidget {
  final List navigatorList;

  TopNavigator({this.navigatorList});

  Widget _gridViewItemUi(context, item) {
    return InkWell(
      onTap: () {
        print('click the button');
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item['image'],
            width: ScreenUtil().setWidth(95),
          ),
          Text(item['mallCategoryName']),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (this.navigatorList.length > 10) {
      this.navigatorList.removeRange(10, this.navigatorList.length);
    }

    return Container(
      height: ScreenUtil().setHeight(250),
      padding: EdgeInsets.all(ScreenUtil().setWidth(3)),
      child: GridView.count(
        crossAxisCount: 5,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        children: navigatorList.map((item) {
          return _gridViewItemUi(context, item);
        }).toList(),
      ),
    );
  }
}
