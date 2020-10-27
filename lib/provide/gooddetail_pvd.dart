import 'package:flutter/material.dart';
import '../model/details.dart';
import '../service/service_method.dart';
import 'dart:convert';

class GoodDetailProvide with ChangeNotifier {
  DetailsModel goodsInfo = null;

  Future getGoodsInfo(String id) async {
    var formData = {'good': id};
    await request(
      url: 'getGoodDetailById',
      data: formData,
    ).then((value) {
      var responseData = jsonDecode(value.toString());

      // print('GoodDetailProvide 得到商品信息');
      // print(responseData);

      goodsInfo = DetailsModel.fromJson(responseData);
      print('得到商品ID: ' + goodsInfo.data.goodInfo.goodsId);
      notifyListeners();
    });
  }
}
