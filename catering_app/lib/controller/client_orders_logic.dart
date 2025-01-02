import 'package:flutter/material.dart';
import 'package:catering_app/data/order_data.dart';
import 'package:catering_app/model/order_model.dart';

class ClientOrdersLogic {
  final OrderData data = OrderData();

  Future<List<OrderDTO>> getOrders() async {
    try {
      return await data.fetchOrders();
    } catch (e) {
      throw Exception('Failed to fetch orders: $e');
    }
  }

  void onOrderClicked(BuildContext context, OrderDTO order) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Clicked on order: ${order.id}")),
    );
  }
}
