import 'package:flutter/material.dart';
import 'package:flutter01/provide/counter.dart';
import "package:provide/provide.dart";
import "package:shared_preferences/shared_preferences.dart";

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Column(
          children: [
            Number(),
            MyButton(context),
          ],
        ),
      ),
    );
  }

  Widget Number() {
    return Container(
      margin: EdgeInsets.only(top: 200),
      child: Provide<Counter>(
        builder: (context, child, counter) {
          return Text(
            '${counter.value}',
            style: TextStyle(fontSize: 20),
          );
        },
      ),
    );
  }

  Widget MyButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Provide.value<Counter>(context).increment();
      },
      child: Text('加加'),
    );
  }
}
