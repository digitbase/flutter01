class CategoryGoods {
  String code;
  String message;
  List<dynamic> data;

  CategoryGoods({this.code, this.message, this.data});

  factory CategoryGoods.fromJson(Map<String, dynamic> json) {
    return CategoryGoods(
      code: json['code'],
      message: json['message'],
      data: json['data'] != null
          ? json['data']
              .map((v) => new CategoryGoodsListData.fromJson(v))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryGoodsListData {
  String image;
  double oriPrice;
  double presentPrice;
  String goodsName;
  String goodsId;

  CategoryGoodsListData(
      {this.image,
      this.oriPrice,
      this.presentPrice,
      this.goodsName,
      this.goodsId});

  factory CategoryGoodsListData.fromJson(Map<String, dynamic> json) {
    return CategoryGoodsListData(
      image: json['image'],
      oriPrice: json['oriPrice'],
      presentPrice: json['presentPrice'],
      goodsName: json['goodsName'],
      goodsId: json['goodsId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> CategoryGoodsListData =
        new Map<String, dynamic>();
    CategoryGoodsListData['image'] = this.image;
    CategoryGoodsListData['oriPrice'] = this.oriPrice;
    CategoryGoodsListData['presentPrice'] = this.presentPrice;
    CategoryGoodsListData['goodsName'] = this.goodsName;
    CategoryGoodsListData['goodsId'] = this.goodsId;
    return CategoryGoodsListData;
  }
}
