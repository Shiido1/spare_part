class ProductModel {
  String id;
  String name;
  String description;
  String imgUrl;
  String imgUrl1;
  String imgUrl2;
  int price;
  int discount;
  String category;
  String carId;
  bool available;
  int stock;
  int weightInKg;
  String createdAt;
  String updatedAt;

  ProductModel(
      {this.id,
        this.name,
        this.description,
        this.imgUrl,
        this.imgUrl1,
        this.imgUrl2,
        this.price,
        this.discount,
        this.category,
        this.carId,
        this.available,
        this.stock,
        this.weightInKg,
        this.createdAt,
        this.updatedAt});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imgUrl = json['img_url'];
    imgUrl1 = json['img_url_1'];
    imgUrl2 = json['img_url_2'];
    price = json['price'];
    discount = json['discount'];
    category = json['category'];
    carId = json['car_id'];
    available = json['available'];
    stock = json['stock'];
    weightInKg = json['weight_in_kg'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['img_url'] = this.imgUrl;
    data['img_url_1'] = this.imgUrl1;
    data['img_url_2'] = this.imgUrl2;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['category'] = this.category;
    data['car_id'] = this.carId;
    data['available'] = this.available;
    data['stock'] = this.stock;
    data['weight_in_kg'] = this.weightInKg;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Brands {
  int id;
  String title;
  String imgUrl;
  String createdAt;

  Brands({this.id, this.title, this.imgUrl, this.createdAt});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imgUrl = json['img_url'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['img_url'] = this.imgUrl;
    data['createdAt'] = this.createdAt;
    return data;
  }
}