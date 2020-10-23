import "package:flutter/material.dart";
import '../model/category_goods_model.dart';

class ChildCategoryGoods with ChangeNotifier {
  int value = 0;
  List<dynamic> goodsList = [];

  getCategoryGoods(List<dynamic> list) {
    //print(list.toString());
    goodsList = list;
    notifyListeners();
  }

  getMoreCategoryGoods(List<dynamic> list) {
    //print(list.toString());
    goodsList.addAll(list);
    notifyListeners();
  }
}
