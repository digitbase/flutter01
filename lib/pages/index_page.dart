import 'package:flutter/material.dart';
import 'package:flutter01/element/lib_element.dart';
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
      label: ('首页'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: ('分类'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: ('购物车'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.people),
      label: ('会员中心'),
    ),
  ];

  //新建导航信息 List
  final List<Widget> tabBodies = [
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
    RLogger.initLogger(
        tag: 'home_page',
        isWriteFile: true,
        fileName: "log.txt",
        filePath: "/etc/apache2/doc/");
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);

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
      body: IndexedStack(
        index: currentIndex,
        children: <Widget>[
          HomePage(),
          CategoryPage(),
          CartPage(),
          MemberPage(),
        ],
      ),
    );
  }
}
