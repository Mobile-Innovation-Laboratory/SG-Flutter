class ProductModel {
  String id;
  String image;
  String title;
  double price;
  String description;
  bool isFavorite;

  ProductModel({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.isFavorite,
  });
}

