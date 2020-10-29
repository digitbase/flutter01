import 'package:flutter/material.dart';
import 'package:flutter01/pages/lib_pages.dart';
import 'package:provide/provide.dart';
import 'provide/cart_provider.dart';
import 'provide/counter.dart';
import 'element/r_log.dart';
import 'config/routers_cfg.dart';
import 'provide/child_category.dart';
import 'provide/child_category_goods.dart';
import 'package:fluro/fluro.dart';
import './routers/routers.dart';
import './routers/application.dart';
import 'provide/gooddetail_pvd.dart';
import 'provide/details_info.dart';

void main() {
  var counter = Counter();
  var childCategory = ChildCategory();
  var childCategoryGoods = ChildCategoryGoods();
  var providers = Providers();
  var goodDetailPvd = GoodDetailProvide();
  var detailInfoProvide = DetailInfoProvide();
  var cartPrivde = CarProvide();

  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(Provider<GoodDetailProvide>.value(goodDetailPvd))
    ..provide(Provider<CarProvide>.value(cartPrivde))
    ..provide(Provider<DetailInfoProvide>.value(detailInfoProvide))
    ..provide(Provider<ChildCategoryGoods>.value(childCategoryGoods));
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routers.configRouters(router);
    Application.router = router;

    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: Application.router.generator,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      routes: staticRoutes,
      initialRoute: "/",
    );
  }
}
