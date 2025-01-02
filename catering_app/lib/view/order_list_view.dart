import 'package:flutter/material.dart';
import 'package:catering_app/model/company_api_proxy.dart';
import 'package:catering_app/data/order_data.dart';

class OrderListView extends StatefulWidget {
  const OrderListView({super.key});

  @override
  State<OrderListView> createState() => _OrderListViewState();
}

class _OrderListViewState extends State<OrderListView> {
  late CateringCompanyAPIProxy apiProxy;
  late Future<List<OrderDTO>> ordersFuture;

  @override
  void initState() {
    super.initState();
    apiProxy = CateringCompanyAPIProxy();
    ordersFuture = apiProxy.getOrders(); // Pobranie zamówień z API
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
            return const Center(
                child: Text('Nie udało się załadować zamówień.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Brak dostępnych zamówień.'));
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
                  onTap: () {
                    // Możliwość dodania szczegółów zamówienia
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Szczegóły zamówienia'),
                        content: Text(
                            'ID: ${order.orderId}\nKlient: ${order.clientLogin}'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Zamknij'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
