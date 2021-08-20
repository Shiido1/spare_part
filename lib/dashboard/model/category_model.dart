class Category {
  int id;
  String title;
  String imgUrl;
  String createdAt;

  Category({this.id, this.title, this.imgUrl, this.createdAt});

  Category.fromJson(Map<String, dynamic> json) {
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