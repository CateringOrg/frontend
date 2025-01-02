import 'package:catering_app/model/order_model.dart';

class OrderData {
  Future<List<OrderDTO>> fetchOrders() async {
    // Symulowana odpowiedz API
    await Future.delayed(const Duration(seconds: 1));

    return [
      OrderDTO(
        id: '1',
        deliveryAddress: '123 Main St',
        deliveryMethod: 'Delivery',
        mealNames: ['Pizza', 'Salad'],
        deliveryTime: '12:30 PM',
        status: 'Dostarczono',
      ),
      OrderDTO(
        id: '2',
        deliveryAddress: '456 Elm St',
        deliveryMethod: 'Pickup',
        mealNames: ['Burger'],
        deliveryTime: '1:00 PM',
        status: 'Czeka',
      ),
    ];
  }
}
