class CarModel {
  Car car;
  List<Models> models;

  CarModel({this.car, this.models});

  CarModel.fromJson(Map<String, dynamic> json) {
    car = json['car'] != null ? new Car.fromJson(json['car']) : null;
    if (json['models'] != null) {
      models = [];
      json['models'].forEach((v) {
        models.add(new Models.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.car != null) {
      data['car'] = this.car.toJson();
    }
    if (this.models != null) {
      data['models'] = this.models.map((v) => v.toJson()).toList();
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

  Car(
      {this.id,
        this.name,
        this.vin,
        this.imgUrl,
        this.brandId,
        this.createdAt,
        this.updatedAt});

  Car.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    vin = json['vin'];
    imgUrl = json['img_url'];
    brandId = json['brand_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
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
    return data;
  }
}

class Models {
  int id;
  String name;
  String slug;
  String year;
  String imgUrl;
  String carId;
  String createdAt;
  String updatedAt;

  Models(
      {this.id,
        this.name,
        this.slug,
        this.year,
        this.imgUrl,
        this.carId,
        this.createdAt,
        this.updatedAt});

  Models.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    year = json['year'];
    imgUrl = json['img_url'];
    carId = json['car_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
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
    return data;
  }
}