import 'package:flutter/material.dart';
import '../model/details.dart';
import '../service/service_method.dart';
import 'dart:convert';

class GoodDetailProvide with ChangeNotifier {
  DetailsModel goodsInfo = null;

  getGoodsInfo(String id) {
    var formData = {'good': id};
    request(
      url: 'getGoodDetailById',
      data: formData,
    ).then((value) {
      var responseData = jsonDecode(value.toString());

      // print('GoodDetailProvide 得到商品信息');
      // print(responseData);

      goodsInfo = DetailsModel.fromJson(responseData);

      notifyListeners();
    });
  }
}
