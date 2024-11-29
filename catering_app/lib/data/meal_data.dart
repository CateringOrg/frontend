class Meal {
  final String id;
  final String description;
  final double price;
  final String imageUrl;

  Meal({
    required this.id,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'],
      description: json['description'],
      price: json['price'],
      imageUrl:
          json['imageUrl'], // Assume this field links to photos_urls_meals
    );
  }
}
