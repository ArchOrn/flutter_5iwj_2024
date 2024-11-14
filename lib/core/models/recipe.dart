class Recipe {
  final int id;
  final String name;
  final String imageUrl;

  Recipe({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image'],
    );
  }
}
