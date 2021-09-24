class GProductModel {
  Product product;
  List<RecentProducts> recentProducts;

  GProductModel({this.product, this.recentProducts});

  GProductModel.fromJson(Map<String, dynamic> json) {
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
  Maker maker;
  Model model;
  List<Null> reviews;

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
      this.maker,
      this.model,
      this.reviews});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] == null ? null : json['id'];
    name = json['name'] == null ? null : json['name'];
    description = json['description'] == null ? null : json['description'];
    imgUrl = json['img_url'] == null ? null : json['img_url'];
    imgUrl1 = json['img_url_1'] == null ? null : json['img_url_1'];
    imgUrl2 = json['img_url_2'] == null ? null : json['img_url_2'];
    price = json['price'] == null ? null : json['price'];
    discount = json['discount'] == null ? null : json['discount'];
    category = json['category'] == null ? null : json['category'];
    modelId = json['model_id'] == null ? null : json['model_id'];
    makerId = json['maker_id'] == null ? null : json['maker_id'];
    available = json['available'] == null ? null : json['available'];
    stock = json['stock'] == null ? null : json['stock'];
    weightInKg = json['weight_in_kg'] == null ? null : json['weight_in_kg'];
    carId = json['car_id'] == null ? null : json['car_id'];
    brandId = json['brand_id'] == null ? null : json['brand_id'];
    year = json['year'] == null ? null : json['year'];
    productCode = json['product_code'] == null ? null : json['product_code'];
    createdAt = json['createdAt'] == null ? null : json['createAt'];
    updatedAt = json['updatedAt'] == null ? null : json['updateAt'];
    maker = json['maker'] != null ? new Maker.fromJson(json['maker']) : null;
    model = json['model'] != null ? new Model.fromJson(json['model']) : null;
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
    if (this.maker != null) {
      data['maker'] = this.maker.toJson();
    }
    if (this.model != null) {
      data['model'] = this.model.toJson();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews.map((v) => v).toList();
    }
    return data;
  }
}

class Maker {
  int id;
  String name;
  String imgUrl;
  String createdAt;
  String updatedAt;

  Maker({this.id, this.name, this.imgUrl, this.createdAt, this.updatedAt});

  Maker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imgUrl = json['img_url'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img_url'] = this.imgUrl;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Model {
  int id;
  String name;
  String slug;
  String year;
  String imgUrl;
  String carId;
  String createdAt;
  String updatedAt;
  Car car;

  Model(
      {this.id,
      this.name,
      this.slug,
      this.year,
      this.imgUrl,
      this.carId,
      this.createdAt,
      this.updatedAt,
      this.car});

  Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    year = json['year'];
    imgUrl = json['img_url'];
    carId = json['car_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    car = json['car'] != null ? new Car.fromJson(json['car']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['year'] = this.year;
    data['img_url'] = this.imgUrl;
    data['car_id'] = this.carId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.car != null) {
      data['car'] = this.car.toJson();
    }
    return data;
  }
}

class Car {
  String id;
  String name;
  Null vin;
  String imgUrl;
  String brandId;
  String createdAt;
  String updatedAt;
  Brand brand;

  Car(
      {this.id,
      this.name,
      this.vin,
      this.imgUrl,
      this.brandId,
      this.createdAt,
      this.updatedAt,
      this.brand});

  Car.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    vin = json['vin'];
    imgUrl = json['img_url'];
    brandId = json['brand_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['vin'] = this.vin;
    data['img_url'] = this.imgUrl;
    data['brand_id'] = this.brandId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.brand != null) {
      data['brand'] = this.brand.toJson();
    }
    return data;
  }
}

class Brand {
  String id;
  String name;
  Null description;
  String imgUrl;
  Null vin;
  String slug;
  String createdAt;
  String updatedAt;

  Brand(
      {this.id,
      this.name,
      this.description,
      this.imgUrl,
      this.vin,
      this.slug,
      this.createdAt,
      this.updatedAt});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imgUrl = json['img_url'];
    vin = json['vin'];
    slug = json['slug'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['img_url'] = this.imgUrl;
    data['vin'] = this.vin;
    data['slug'] = this.slug;
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
    return data;
  }
}
