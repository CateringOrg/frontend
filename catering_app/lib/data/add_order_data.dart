class AddOrderDTO {
  String deliveryAddress;
  String deliveryMethod;
  List<String> mealIds;
  String deliveryTime;

  AddOrderDTO({
    this.deliveryAddress = '',
    this.deliveryMethod = 'delivery',
    required this.mealIds,
    this.deliveryTime = '',
  });
}
