import "package:flutter/material.dart";
import "../model/category_model.dart";

class ChildCategory with ChangeNotifier {
  int value = 0;
  List<dynamic> childCategoryList = [];
  int childCategoryId = 0;
  String categoryId = '2c9f6c946cd22d7b016cd74220b70040';
  String subId = '';

  getChildCategory(List<dynamic> list, String id) {
    BxMallSubDto all = new BxMallSubDto();
    all.mallCategoryId = '00';
    all.mallSubName = "全部";
    all.comments = 'null';
    all.mallSubId = '00';

    categoryId = id;
    childCategoryId = 0;
    childCategoryList = [all];
    childCategoryList.addAll(list);
    notifyListeners();
  }

  changeChildIndex(index, String id) {
    childCategoryId = index;
    subId = id;
    notifyListeners();
  }
}
