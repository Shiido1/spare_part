class SparePartModel {
  int limit;
  List<Products> products;
  int total;
  int showing;

  SparePartModel({this.limit, this.products, this.total, this.showing});

  SparePartModel.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    total = json['total'];
    showing = json['showing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit'] = this.limit;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['showing'] = this.showing;
    return data;
  }
}

class Products {
  String id;
  String name;
  String description;
  String imgUrl;
  String imgUrl1;
  String imgUrl2;
  int price;
  int discount;
  String category;
  int modelId;
  int makerId;
  bool available;
  int stock;
  String weightInKg;
  String carId;
  String brandId;
  String year;
  String productCode;
  String createdAt;
  String updatedAt;
  List<Reviews> reviews;

  Products(
      {this.id,
      this.name,
      this.description,
      this.imgUrl,
      this.imgUrl1,
      this.imgUrl2,
      this.price,
      this.discount,
      this.category,
      this.modelId,
      this.makerId,
      this.available,
      this.stock,
      this.weightInKg,
      this.carId,
      this.brandId,
      this.year,
      this.productCode,
      this.createdAt,
      this.updatedAt,
      this.reviews});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imgUrl = json['img_url'];
    imgUrl1 = json['img_url_1'];
    imgUrl2 = json['img_url_2'];
    price = json['price'];
    discount = json['discount'];
    category = json['category'];
    modelId = json['model_id'];
    makerId = json['maker_id'];
    available = json['available'];
    stock = json['stock'];
    weightInKg = json['weight_in_kg'];
    carId = json['car_id'];
    brandId = json['brand_id'];
    year = json['year'];
    productCode = json['product_code'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['reviews'] != null) {
      reviews = new List<Reviews>();
      json['reviews'].forEach((v) {
        reviews.add(new Reviews.fromJson(v));
      });
    }
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
    data['model_id'] = this.modelId;
    data['maker_id'] = this.makerId;
    data['available'] = this.available;
    data['stock'] = this.stock;
    data['weight_in_kg'] = this.weightInKg;
    data['car_id'] = this.carId;
    data['brand_id'] = this.brandId;
    data['year'] = this.year;
    data['product_code'] = this.productCode;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.reviews != null) {
      data['reviews'] = this.reviews.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  int id;
  String userId;
  String partId;
  String review;
  int rating;
  String createdAt;
  String updatedAt;

  Reviews(
      {this.id,
      this.userId,
      this.partId,
      this.review,
      this.rating,
      this.createdAt,
      this.updatedAt});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    partId = json['part_id'];
    review = json['review'];
    rating = json['rating'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['part_id'] = this.partId;
    data['review'] = this.review;
    data['rating'] = this.rating;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
