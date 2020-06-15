import 'package:flutter/material.dart';
import 'package:flutter01/pages/lib_pages.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperDiy extends StatelessWidget {
  final List swiperDataList;
  final double setHight;

  SwiperDiy({this.swiperDataList, this.setHight});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: setHight,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(swiperDataList[index]['image']);
        },
        itemCount: swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
