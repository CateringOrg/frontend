class Meal {
  final String id;
  final String name;
  final String description;
  final double price;
  final String photoUrls;

  Meal({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.photoUrls,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        photoUrls: json['photoUrls']);
  }
}
