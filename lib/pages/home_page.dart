import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter01/service/service_method.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textContorl = TextEditingController();
  String selectText = "你好您选择的是";

  @override
  void initState() {
    getHomePageContext().then((value) {
      //print(value.toString());
      setState(() {
        selectText = value.toString();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //getHttp();
    return Scaffold(
      appBar: AppBar(
        title: Text('美好人间'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller: textContorl,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  labelText: 'nihao',
                  helperText: "请输入！",
                ),
                autofocus: false,
              ),
              RaisedButton(
                onPressed: () {
                  _choiceAction(context);
                },
                child: Text('选择完毕'),
              ),
              Container(
                child: Text(selectText),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _choiceAction(context) {
    print('start select.............');
    if (textContorl.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text('美女不能为空')),
      );
    } else {
      getHttp(textContorl.text.trim()).then(
        (value) => {
          setState(() {
            Map a = jsonDecode(value);

            print(a['data'].toString());
            if (a['data'].toString() == "[]") {
              selectText = "没有数据";
            } else {
              selectText = a['data'][0]['root'].toString();
            }
          })
        },
      );
    }
  }

  Future getHttp(String typeText) async {
    try {
      var data = {'word': typeText};
      Response response = await Dio().get(
        "https://s.ohltr.com/searchapi.php",
        queryParameters: data,
        options: RequestOptions(),
      );
      //print(response.data);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
