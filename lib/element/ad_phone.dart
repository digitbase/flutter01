import 'package:flutter/material.dart';
import 'package:flutter01/pages/lib_pages.dart';
import 'package:url_launcher/url_launcher.dart';

class LeaderPhone extends StatelessWidget {
  final String leaderImage;
  final String leaderPhone;

  LeaderPhone({this.leaderImage, this.leaderPhone});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(180),
      child: InkWell(
        onTap: _launchURL,
        child: Image.network(this.leaderImage),
      ),
    );
  }

  _launchURL() async {
    String url = "tel:" + leaderPhone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('aaa');
    }
  }
}
