import 'package:flutter/material.dart';
import 'package:flutter01/service/service_method.dart';
import '../model/category.dart';
import 'dart:convert';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    _getCategory();
    return Container(
      child: Container(
        child: Text('分类'),
      ),
    );
  }

  void _getCategory() async {
    await request(
      url: 'getCategory',
    ).then((val) {
      var data = json.decode(val.toString());
      print(data);
      print(data['message']);
    });
  }
}
