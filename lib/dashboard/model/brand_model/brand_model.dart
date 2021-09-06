class Brands {
  String id;
  String name;
  Null description;
  String imgUrl;
  Null vin;
  Null slug;
  String createdAt;
  String updatedAt;

  Brands(
      {this.id,
        this.name,
        this.description,
        this.imgUrl,
        this.vin,
        this.slug,
        this.createdAt,
        this.updatedAt});

  Brands.fromJson(Map<String, dynamic> json) {
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