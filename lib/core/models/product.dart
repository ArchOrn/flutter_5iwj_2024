class Product {
  final int id;
  final String title;
  final String description;
  final String imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['thumbnail'],
    );
  }
}
