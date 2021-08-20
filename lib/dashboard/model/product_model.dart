class GetProductModel {
  Product product;
  List<RecentProducts> recentProducts;

  GetProductModel({this.product, this.recentProducts});

  GetProductModel.fromJson(Map<String, dynamic> json) {
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    if (json['recent_products'] != null) {
      recentProducts = [];
      json['recent_products'].forEach((v) {
        recentProducts.add(new RecentProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    if (this.recentProducts != null) {
      data['recent_products'] =
          this.recentProducts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
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
  Car car;
  List<String> reviews;

  Product(
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
        this.updatedAt,
        this.car,
        this.reviews});

  Product.fromJson(Map<String, dynamic> json) {
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
    car = json['car'] != null ? new Car.fromJson(json['car']) : null;
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews.add((v));
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
    data['car_id'] = this.carId;
    data['available'] = this.available;
    data['stock'] = this.stock;
    data['weight_in_kg'] = this.weightInKg;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.car != null) {
      data['car'] = this.car.toJson();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews.map((v) => v).toList();
    }
    return data;
  }
}

class Car {
  String id;
  String name;
  String model;
  String year;
  String vin;
  String brand;
  String imgUrl;
  String createdAt;
  String updatedAt;

  Car(
      {this.id,
        this.name,
        this.model,
        this.year,
        this.vin,
        this.brand,
        this.imgUrl,
        this.createdAt,
        this.updatedAt});

  Car.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    model = json['model'];
    year = json['year'];
    vin = json['vin'];
    brand = json['brand'];
    imgUrl = json['img_url'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['model'] = this.model;
    data['year'] = this.year;
    data['vin'] = this.vin;
    data['brand'] = this.brand;
    data['img_url'] = this.imgUrl;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class RecentProducts {
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

  RecentProducts(
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

  RecentProducts.fromJson(Map<String, dynamic> json) {
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