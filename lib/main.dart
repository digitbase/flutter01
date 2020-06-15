import 'package:flutter/material.dart';
import 'package:flutter01/pages/lib_pages.dart';

import 'config/routers_cfg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      routes: staticRoutes,
      initialRoute: "/",
    );
  }
}
