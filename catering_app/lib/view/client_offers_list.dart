import 'package:catering_app/controller/client_cart_controller.dart';
import 'package:catering_app/view/client_cart_ui.dart';
import 'package:flutter/material.dart';
import 'package:catering_app/assets/colors.dart';
import 'package:catering_app/controller/client_offers_controller.dart';
import 'package:catering_app/data/meal_data.dart';
import 'package:catering_app/data/cart_data.dart';

class ClientOffersListView extends StatefulWidget {
  const ClientOffersListView({super.key});

  @override
  State<ClientOffersListView> createState() => _ClientOffersListViewState();
}

class _ClientOffersListViewState extends State<ClientOffersListView> {
  late final ClientCartLogic clientCartLogic;
  late final ClientOffersLogic clientOffersLogic;
  late final ClientCartUI clientCartUI;

  @override
  void initState() {
    super.initState();

    final cartData = CartData();

    clientCartUI = ClientCartUI(context, null);

    clientCartLogic = ClientCartLogic(clientCartUI, cartData);

    clientCartUI.logic = clientCartLogic;

    clientOffersLogic = ClientOffersLogic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Oferta"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_left),
          onPressed: () => clientOffersLogic.onBackClicked(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => clientCartLogic.showClientOffersUI(context),
          ),
        ],
      ),
      body: FutureBuilder<List<Meal>>(
        future: clientOffersLogic.fetchOffers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "Nie mamy dostępnych posiłków. Wróć później po nowości!",
              ),
            );
          }

          final meals = snapshot.data!;
          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              final meal = meals[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        child: Image.network(
                          meal.photoUrls,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              meal.description,
                              style: const TextStyle(
                                fontSize: 26,
                                color: AppColor.fontEmphasis,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 12.0),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () =>
                                    clientCartLogic.addMealToCart(meal),
                                child: const Text(
                                  "Dodaj do koszyka",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                            const SizedBox(height: 22.0),
                            Text(
                              "Cena: ${meal.price} zł",
                              style: const TextStyle(
                                fontSize: 18,
                                color: AppColor.fontEmphasis,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
