class Data  {
	String image;
	double oriPrice;
	double presentPrice;
	String goodsName;
	String goodsId;

	Data({this.image, this.oriPrice, this.presentPrice, this.goodsName, this.goodsId});

	factory Data.fromJson(Map<String, dynamic> json) {
		return Data(
			image: json['image'],
			oriPrice: json['oriPrice'],
			presentPrice: json['presentPrice'],
			goodsName: json['goodsName'],
			goodsId: json['goodsId'],
		);
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['image'] = this.image;
		data['oriPrice'] = this.oriPrice;
		data['presentPrice'] = this.presentPrice;
		data['goodsName'] = this.goodsName;
		data['goodsId'] = this.goodsId;
		return data;
	}


}
