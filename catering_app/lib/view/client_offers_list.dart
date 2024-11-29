import 'dart:async';
import 'package:flutter/material.dart';
import 'package:catering_app/assets/colors.dart';
import 'package:catering_app/controller/client_offers_controller.dart';
import 'package:catering_app/data/meal_data.dart';

class ClientOffersListView extends StatefulWidget {
  const ClientOffersListView({super.key});

  @override
  _ClientOffersListViewState createState() => _ClientOffersListViewState();
}

class _ClientOffersListViewState extends State<ClientOffersListView> {
  final ClientOffersLogic logic = ClientOffersLogic();
  String? _message;
  bool _isSuccess = true;

  Future<void> _addToCart(String mealId, String userId) async {
    final result = await logic.addMealToCart(mealId, userId);
    if (result['success']) {
      setState(() {
        _message = "Produkt pomyślnie dodany do koszyka!";
        _isSuccess = true;
      });
    } else {
      setState(() {
        _message = result['message'] ??
            "Wystąpił błąd podczas dodawania produktu do koszyka!";
        _isSuccess = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Oferta"),
      ),
      body: Stack(children: [
        FutureBuilder<List<Meal>>(
          future: logic.fetchOffers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                    "Nie mamy dostępnych posiłków. Wróć póżniej po nowości!"),
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
                            meal.imageUrl,
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
                                  onPressed: () => _addToCart(
                                      meal.id, "user_id"), //TODO user_id
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
        if (_message != null)
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(12.0),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _message!,
                  style: const TextStyle(
                    color: AppColor.fontEmphasis,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  _isSuccess
                      ? "lib/assets/cart_success.png"
                      : "lib/assets/error.png",
                  width: 600,
                  height: 600,
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: 600,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _message = null;
                      });
                    },
                    child: const Text(
                      "OK",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                )
              ],
            ),
          ),
      ]),
    );
  }
}
