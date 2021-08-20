import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class ProductModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String description;
  @HiveField(3)
  String imgUrl;
  @HiveField(4)
  String imgUrl1;
  @HiveField(5)
  String imgUrl2;
  @HiveField(6)
  int price;
  @HiveField(7)
  int discount;
  @HiveField(8)
  String category;
  @HiveField(9)
  String carId;
  @HiveField(10)
  bool available;
  @HiveField(11)
  int stock;
  @HiveField(12)
  int weightInKg;
  @HiveField(13)
  String createdAt;
  @HiveField(14)
  String updatedAt;

  ProductModel({this.id,
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

  ProductModel copyWith({
    String id,
    String name,
    String description,
    String imgUrl,
    String imgUrl1,
    String imgUrl2,
    int price,
    int discount,
    String category,
    String carId,
    int available,
    int stock,
    int weightInKg,
    String createdAt,
    String updatedAt,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imgUrl: imgUrl ?? this.imgUrl,
      imgUrl1: imgUrl1 ?? this.imgUrl1,
      imgUrl2: imgUrl2 ?? this.imgUrl2,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      category: category ?? this.category,
      carId: carId ?? this.carId,
      available: available ?? this.available,
      stock: stock ?? this.stock,
      weightInKg: weightInKg ?? this.weightInKg,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imgUrl,
      'imageUrl1': imgUrl1,
      'imageUrl2': imgUrl2,
      'price': price,
      'discount': discount,
      'category': category,
      'carId': carId,
      'availble': available,
      'stock': stock,
      'weightInKg': weightInKg,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

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

  @override
  String toString() {
    return
      'ProductModel('
          'id: $id,'
          ' name: $name,'
          ' description: $description,'
          ' imgUrl: $imgUrl, '
          'imgUrl1: $imgUrl1, '
          'imgUrl2: $imgUrl2,'
          ' price: $price, '
          'discount: $discount,'
          ' category: $category, '
          'carId: $carId, available: $available,'
          ' stock: $stock, weightInKg: $weightInKg, '
          'createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.imgUrl == imgUrl &&
        other.imgUrl1 == imgUrl1 &&
        other.imgUrl2 == imgUrl2 &&
        other.price == price &&
        other.discount == discount &&
        other.category == category &&
        other.carId == carId &&
        other.available == available &&
        other.stock == stock &&
        other.weightInKg == weightInKg &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    name.hashCode ^
    description.hashCode ^
    imgUrl.hashCode ^
    imgUrl1.hashCode ^
    imgUrl2.hashCode ^
    price.hashCode ^
    discount.hashCode ^
    category.hashCode ^
    carId.hashCode ^
    available.hashCode ^
    stock.hashCode ^
    weightInKg.hashCode ^
    createdAt.hashCode ^
    updatedAt.hashCode;
  }
}



