import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperDiy extends StatelessWidget {
  final List swiperDataList;

  SwiperDiy({this.swiperDataList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 333,
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
