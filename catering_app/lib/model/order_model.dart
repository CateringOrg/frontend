class OrderDTO {
  final String id;
  final String deliveryAddress;
  final String deliveryMethod;
  final List<String> mealNames;
  final String deliveryTime;
  final String status;

  OrderDTO({
    required this.id,
    required this.deliveryAddress,
    required this.deliveryMethod,
    required this.mealNames,
    required this.deliveryTime,
    required this.status,
  });

  factory OrderDTO.fromJson(Map<String, dynamic> json) {
    return OrderDTO(
      id: json['id'],
      deliveryAddress: json['deliveryAddress'],
      deliveryMethod: json['deliveryMethod'],
      mealNames: List<String>.from(json['mealNames']),
      deliveryTime: json['deliveryTime'],
      status: json['status'],
    );
  }
}
