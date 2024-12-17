class AddOrderDTO {
  String clientLogin;
  String deliveryAddress;
  String deliveryMethod;
  List<String> mealIds;
  String deliveryTime;

  AddOrderDTO({
    this.clientLogin = '',
    this.deliveryAddress = '' ,
    this.deliveryMethod = 'delivery',
    required this.mealIds,
    this.deliveryTime = '',
  });
}