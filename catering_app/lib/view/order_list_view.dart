import 'package:flutter/material.dart';
import 'package:catering_app/controller/client_orders_logic.dart';
import 'package:catering_app/model/order_model.dart';

class OrderListView extends StatefulWidget {
  final String? userId; // Optional parameter for filtering by user ID

  const OrderListView({super.key, this.userId});

  @override
  State<OrderListView> createState() => _OrderListViewState();
}

class _OrderListViewState extends State<OrderListView> {
  late ClientOrdersLogic controller;
  late Future<List<OrderDTO>> ordersFuture;

  @override
  void initState() {
    super.initState();
    controller = ClientOrdersLogic();
    ordersFuture = controller.getOrders(); // Optionally use widget.userId for filtering
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Zamówienia')),
      body: FutureBuilder<List<OrderDTO>>(
        future: ordersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load orders.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No orders available.'));
          }

          final orders = snapshot.data!;

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                elevation: 2,
                child: ListTile(
                  title: Text(order.deliveryAddress),
                  subtitle: Text(
                    'Metoda: ${order.deliveryMethod}\nCzas: ${order.deliveryTime}',
                  ),
                  trailing: Text(
                    order.status,
                    style: TextStyle(
                      color: order.status == 'Dostarczono'
                          ? Colors.green
                          : Colors.orange,
                    ),
                  ),
                  onTap: () => controller.onOrderClicked(context, order),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
