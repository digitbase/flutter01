import 'package:flutter/material.dart';
import '../model/details.dart';
import '../service/service_method.dart';
import 'dart:convert';

class DetailInfoProvide with ChangeNotifier {
  DetailsModel goodsInfo = null;
  String goodsId = '';

  bool isLeft = true;

  changeLeft(String leftState) {
    if (leftState == 'left') {
      isLeft = true;
    } else {
      isLeft = false;
    }
    notifyListeners();
  }

  getGoodsInfo(String id) {
    var formData = {'goodId': id};
    request(url: 'getGoodDetailById', data: formData).then((val) {
      var responseData = json.decode(val.toString());
      print('==============');
      print(responseData);
      print('==============');

      goodsInfo = DetailsModel.fromJson(responseData);
      notifyListeners();
    });
  }
}
