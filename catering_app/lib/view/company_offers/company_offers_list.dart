import 'package:catering_app/assets/colors.dart';
import 'package:catering_app/controller/company_offers_logic/show_offers_list_logic.dart';
import 'package:catering_app/data/meal_data.dart';
import 'package:flutter/material.dart';

class CateringCompanyOffersListView extends StatefulWidget {
  final List<Meal>? meals;

  const CateringCompanyOffersListView({super.key, this.meals});

  @override
  State<CateringCompanyOffersListView> createState() =>
      _CateringCompanyOffersListViewState();
}

class _CateringCompanyOffersListViewState
    extends State<CateringCompanyOffersListView> {
  late final CateringCompanyShowOffersListLogic logic;

  @override
  void initState() {
    super.initState();
    logic = CateringCompanyShowOffersListLogic(context);
  }

  @override
  Widget build(BuildContext context) {
    final meals = widget.meals;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Oferta"),
      ),
      body: meals == null || meals.isEmpty
          ? const Center(
              child: Text(
                "Nie dodałeś jeszcze żadnych posiłków do swojej oferty. Możesz to zrobić klikając przycisk 'Dodaj posiłek'",
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.edit),
                                          onPressed: () =>
                                              logic.onShowUpdateMealFormClicked(
                                                  meal.id),
                                          tooltip: "Edytuj posiłek",
                                        ),
                                      ],
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
                  ),
                ),
                const SizedBox(height: 12.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () => logic.onShowAddMealFormClicked(),
                    child: const Text(
                      "Dodaj posiłek",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
              ],
            ),
    );
  }
}
