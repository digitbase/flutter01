import 'package:flutter/material.dart';
import 'package:flutter01/provide/counter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:provide/provide.dart";
import "package:shared_preferences/shared_preferences.dart";

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> testList = [];

  @override
  Widget build(BuildContext context) {
    _show();

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        //color: Colors.black,
        height: 1000,
        width: ScreenUtil().setWidth(750),
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                _add();
                print(testList);
              },
              child: Text('增加'),
            ),
            RaisedButton(
              onPressed: () {
                _clear();
              },
              child: Text('减少'),
            ),
            Container(
              height: 500,
              child: ListView.builder(
                itemCount: testList.length,
                itemBuilder: (context, index) {
                  return Text(testList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _add() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String temp = "this is test32";
    testList.add(temp);
    prefs.setStringList('testInfo', testList);

    _show();
  }

  void _show() async {
    print('_show() is here');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('testInfo') != null) {
      setState(() {
        testList = prefs.getStringList("testInfo");
      });
    } else {
      setState(() {
        testList = [];
      });
    }
  }

  void _clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('testInfo');
    _show();
  }
}

// class CartPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Number(),
//             MyButton(context),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget Number() {
//     return Container(
//       margin: EdgeInsets.only(top: 200),
//       child: Provide<Counter>(
//         builder: (context, child, counter) {
//           return Text(
//             '${counter.value}',
//             style: TextStyle(fontSize: 20),
//           );
//         },
//       ),
//     );
//   }

//   Widget MyButton(BuildContext context) {
//     return RaisedButton(
//       onPressed: () {
//         Provide.value<Counter>(context).increment();
//       },
//       child: Text('加加'),
//     );
//   }
// }
