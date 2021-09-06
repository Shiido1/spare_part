class BrandModel {
  Brand brand;
  List<Cars> cars;

  BrandModel({this.brand, this.cars});

  BrandModel.fromJson(Map<String, dynamic> json) {
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    if (json['cars'] != null) {
      cars = [];
      json['cars'].forEach((v) {
        cars.add(new Cars.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.brand != null) {
      data['brand'] = this.brand.toJson();
    }
    if (this.cars != null) {
      data['cars'] = this.cars.map((v) => v.toJson()).toList();
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

class Cars {
  String id;
  String name;
  Null vin;
  String imgUrl;
  String brandId;
  String createdAt;
  String updatedAt;

  Cars(
      {this.id,
        this.name,
        this.vin,
        this.imgUrl,
        this.brandId,
        this.createdAt,
        this.updatedAt});

  Cars.fromJson(Map<String, dynamic> json) {
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