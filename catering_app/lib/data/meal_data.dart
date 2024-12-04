class Meal {
  final String id;
  final String description;
  final double price;
  final String photoUrls;

  Meal({
    required this.id,
    required this.description,
    required this.price,
    required this.photoUrls,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'],
      description: json['description'],
      price: json['price'],
      photoUrls: json['photoUrls']
    );
  }
}
