import 'package:flutter/material.dart';
import 'package:flutter01/service/service_method.dart';
import '../model/category_model.dart';
import '../model/category_goods_model.dart';
import "../element/r_log.dart";
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:provide/provide.dart";
import '../provide/child_category.dart';
import '../provide/child_category_goods.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品分类"),
      ),
      body: Container(
        child: Row(
          children: [
            LeftCategoryNav(),
            Column(
              children: [
                _RightCategoryNav(),
                CategoryGoodsList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//左侧大类导航
class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  @override
  void initState() {
    RLogger.instance.d('开始', tag: '_LeftCategoryNavState.initState');
    _getCategory();
    _getGoodsList(null);
    super.initState();
  }

  List list = [];
  var listIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            width: 1,
            color: Colors.black12,
          ),
        ),
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return _leftInkWell(index);
        },
      ),
    );
  }

  Widget _leftInkWell(int index) {
    bool isClick = false;
    isClick = (index == listIndex) ? true : false;
    return InkWell(
      onTap: () {
        var childList = list[index].bxMallSubDto;
        var childListId = list[index].mallCategoryId;
        setState(() {
          listIndex = index;
        });
        print('>>>>>>>>>${childListId}>>>>>>>>>>>>>');
        Provide.value<ChildCategory>(context).getChildCategory(childList);
        _getGoodsList(childListId);
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
          color: isClick ? Colors.black26 : Colors.white,
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.black12),
          ),
        ),
        child: Text(
          list[index].mallCategoryName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(28),
          ),
        ),
      ),
    );
  }

  void _getGoodsList(String categoryId) async {
    var data = {
      'categoryId':
          categoryId == null ? "2c9f6c946cd22d7b016cd74220b70040" : categoryId,
      'CategorySubId': "",
      'page': 1,
    };

    await request(url: 'getMallGoods', data: data).then((val) {
      var data = jsonDecode(val.toString());
      CategoryGoods goodlist = CategoryGoods.fromJson(data);
      print(goodlist.data[0].goodsName);

      Provide.value<ChildCategoryGoods>(context)
          .getCategoryGoods(goodlist.data);

      // list = goodlist.data;
      //RLogger.instance.d(data, tag: 'CategoryGoodsList');
    });
  }

  void _getCategory() async {
    await request(
      url: 'getCategory',
    ).then((val) {
      var data = json.decode(val.toString());
      CategoryModel categoryList = CategoryModel.fromJson(data);
      setState(() {
        list = categoryList.data;
      });

      Provide.value<ChildCategory>(context)
          .getChildCategory(list[0].bxMallSubDto);
    });
  }
}

class _RightCategoryNav extends StatefulWidget {
  @override
  __RightCategoryNavState createState() => __RightCategoryNavState();
}

class __RightCategoryNavState extends State<_RightCategoryNav> {
  @override
  Widget build(BuildContext context) {
    return Provide<ChildCategory>(
      builder: (context, child, childCategory) {
        List cateList = childCategory.childCategoryList;
        return Container(
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(570),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(width: 1, color: Colors.black12),
            ),
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cateList.length,
            itemBuilder: (context, index) {
              return _rightInkWell(cateList[index]);
            },
          ),
        );
      },
    );
  }

  Widget _rightInkWell(BxMallSubDto item) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 10.0),
        child: Text(item.mallSubName),
      ),
    );
  }
}

//商品列表
class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

//商品列表
class _CategoryGoodsListState extends State<CategoryGoodsList> {
  List list = [];

  @override
  Widget build(BuildContext context) {
    RLogger.instance.d('开始', tag: 'CategoryGoodsList');

    return Provide<ChildCategoryGoods>(
        builder: (context, child, childCategoryGoods) {
      List data = childCategoryGoods.goodsList;

      return Container(
        width: ScreenUtil().setWidth(570),
        height: ScreenUtil().setHeight(900),
        child: ListView.builder(
          itemCount: childCategoryGoods.goodsList.length,
          itemBuilder: (context, index) {
            return _listWidget(childCategoryGoods.goodsList, index);
          },
        ),
      );
    });
  }

  Widget _goodsImage(data, index) {
    return Container(
      child: Image.network(data[index].image),
      width: ScreenUtil().setWidth(200),
    );
  }

  Widget _goodsPrice(data, index) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Row(
        children: [
          Text(
            '价格: ${data[index].presentPrice}',
            style:
                TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(30)),
          ),
          Text('${data[index].oriPrice}'),
        ],
      ),
    );
  }

  Widget _goodsName(data, index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        data[index].goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  Widget _listWidget(List<dynamic> data, int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12)),
        ),
        child: Row(
          children: [
            _goodsImage(data, index),
            Column(
              children: [
                _goodsName(data, index),
                _goodsPrice(data, index),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
