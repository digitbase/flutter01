import 'package:flutter/material.dart';
import "./lib_pages.dart";

class IndexPages extends StatefulWidget {
  @override
  _IndexPagesState createState() => _IndexPagesState();
}

class _IndexPagesState extends State<IndexPages> {
  //新建底部导航图标List
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('首页'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      title: Text('分类'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      title: Text('购物车'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.people),
      title: Text('会员中心'),
    ),
  ];

  //新建导航信息 List
  final List tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage(),
  ];

  //当前页面 index
  int currentIndex = 0;
  var currentPage;

  //初始化
  @override
  void initState() {
    currentPage = tabBodies[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1),
      //底部菜单
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bottomTabs,
        currentIndex: currentIndex,
        //切换底部
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[index];
          });
        },
      ),
      // appBar: AppBar(
      //   title: Text('Title'),
      // ),
      body: currentPage,
    );
  }
}
