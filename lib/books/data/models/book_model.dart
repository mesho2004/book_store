class BookModel {
  int? id;
  String? title;
  String? category;
  String? description;
  String? price;
  String? image;

  BookModel(
      {this.id,
      this.title,
      this.category,
      this.description,
      this.price,
      this.image});

  BookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    category = json['category'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
  }
}
