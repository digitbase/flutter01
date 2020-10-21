import "package:flutter/material.dart";
import "../model/category_model.dart";

class ChildCategory with ChangeNotifier {
  int value = 0;
  List<dynamic> childCategoryList = [];

  getChildCategory(List<dynamic> list) {
    BxMallSubDto all = new BxMallSubDto();
    all.mallCategoryId = '00';
    all.mallSubName = "全部";
    all.comments = 'null';
    all.mallSubId = '00';

    childCategoryList = [all];
    childCategoryList.addAll(list);
    notifyListeners();
  }
}
