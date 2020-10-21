import "data.dart";

class CategoryGoods  {
	String code;
	String message;
	List<Data> data;

	CategoryGoods({this.code, this.message, this.data});

	factory CategoryGoods.fromJson(Map<String, dynamic> json) {
		return CategoryGoods(
			code: json['code'],
			message: json['message'],
			data: json['data'] != null ? json['data'].map((v) => new Data.fromJson(v)).toList() : null,
		);
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = this.code;
		data['message'] = this.message;
		if (this.data!= null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
		return data;
	}


}
