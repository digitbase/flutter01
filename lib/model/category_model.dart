import "../element/r_log.dart";

class CategoryModel {
  String code;
  String message;
  List<dynamic> data;

  CategoryModel({this.code, this.message, this.data});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      code: json['code'],
      message: json['message'],
      data: json['data'] != null
          ? json['data'].map((v) => new DataCategory.fromJson(v)).toList()
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

class DataCategory {
  String mallCategoryId;
  String mallCategoryName;
  List<dynamic> bxMallSubDto;
  String comments;
  String image;

  DataCategory(
      {this.mallCategoryId,
      this.mallCategoryName,
      this.bxMallSubDto,
      this.comments,
      this.image});

  factory DataCategory.fromJson(Map<String, dynamic> json) {
    //RLogger.instance.d(json['mallCategoryName'], tag: 'DataCategory tag');
    return DataCategory(
      mallCategoryId: json['mallCategoryId'],
      mallCategoryName: json['mallCategoryName'],
      bxMallSubDto: json['bxMallSubDto'] != null
          ? json['bxMallSubDto']
              .map((v) => new BxMallSubDto.fromJson(v))
              .toList()
          : null,
      comments: json['comments'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataCategory = new Map<String, dynamic>();
    dataCategory['mallCategoryId'] = this.mallCategoryId;
    dataCategory['mallCategoryName'] = this.mallCategoryName;
    if (this.bxMallSubDto != null) {
      dataCategory['bxMallSubDto'] =
          this.bxMallSubDto.map((v) => v.toJson()).toList();
    }
    dataCategory['comments'] = this.comments;
    dataCategory['image'] = this.image;
    return dataCategory;
  }
}

class BxMallSubDto {
  String mallSubId;
  String mallCategoryId;
  String mallSubName;
  String comments;

  BxMallSubDto(
      {this.mallSubId, this.mallCategoryId, this.mallSubName, this.comments});

  BxMallSubDto.fromJson(Map<String, dynamic> json) {
    //RLogger.instance.d(json.toString(), tag: 'new tag');
    mallSubId = json['mallSubId'];
    mallCategoryId = json['mallCategoryId'];
    mallSubName = json['mallSubName'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    //RLogger.instance.d('toJson', tag: 'new tag');
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallSubId'] = this.mallSubId;
    data['mallCategoryId'] = this.mallCategoryId;
    data['mallSubName'] = this.mallSubName;
    data['comments'] = this.comments;
    return data;
  }
}
