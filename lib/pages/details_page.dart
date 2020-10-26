import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/gooddetail_pvd.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;

  DetailsPage(this.goodsId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('商品详细'),
      ),
      body: FutureBuilder(
        future: _getBackInfo(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: Column(
                children: [
                  Text('ddd'),
                ],
              ),
            );
          } else {}
        },
      ),
    );
  }

  Future _getBackInfo(BuildContext context) async {
    await Provide.value<GoodDetailProvide>(context).getGoodsInfo(goodsId);
    return "完成加载";
  }
}
