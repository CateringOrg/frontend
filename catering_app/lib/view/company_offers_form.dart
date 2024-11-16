import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_app/controller/company_offers_controller.dart';
import 'package:catering_app/data/add_meal_data.dart';

class MealFormView extends StatefulWidget {
  const MealFormView({super.key});

  @override
  State<MealFormView> createState() => _MealFormViewState();
}

class _MealFormViewState extends State<MealFormView> {
  final AddMealDTO formData = AddMealDTO();  

  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final photoUrlController = TextEditingController();
  String? generalError;

   @override
  void initState() {
    super.initState();
    descriptionController.text = formData.description;
    priceController.text = formData.price;
    photoUrlController.text = formData.photoUrl;

    descriptionController.addListener(() {
      formData.description = descriptionController.text;
    });
    priceController.addListener(() {
      formData.price = priceController.text;
    });
    photoUrlController.addListener(() {
      formData.photoUrl = photoUrlController.text;
    });
  }

  @override
  void dispose() {
    descriptionController.dispose();
    priceController.dispose();
    photoUrlController.dispose();
    super.dispose();
  }

  void validateAndSave(BuildContext context) {
    final logic = CateringCompanyOffersLogic(context);
    setState(() {
      generalError = null;

      final errors = logic.validateMealData(formData);

      if (errors.isNotEmpty) {
        generalError = errors.join("\n");
        return;
      }

      logic.onSaveDataClicked(formData);
    });
  }

  @override
  Widget build(BuildContext context) {
    final logic = CateringCompanyOffersLogic(context);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(title: const Text("Dodaj posiłek")),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Dodaj posiłek do oferty',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("Opis"),
                  const SizedBox(height: 8),
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Posiłek 123',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("Cena"),
                  const SizedBox(height: 8),
                  TextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '123.45',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("URL zdjęcia"),
                  const SizedBox(height: 8),
                  TextField(
                    controller: photoUrlController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'https://www.image.com',
                    ),
                    onChanged: (url) {
                      setState(() {});
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Container(
                height: 300,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                ),
                child: photoUrlController.text.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                            photoUrlController.text,
                            fit: BoxFit.contain,
                            width: double.infinity,
                            height: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                            return const Text(
                                "Nie udało się załadować zdjęcia",
                                textAlign: TextAlign.center,
                            );
                            },
                        ),
                        )
                    : const Text(
                        "Brak zdjęcia",
                        textAlign: TextAlign.center,
                        ),
                ),

              const SizedBox(height: 30),

              if (generalError != null)
                Text(
                  generalError!,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                  textAlign: TextAlign.center,
                ),

              const SizedBox(height: 10),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadowColor: Colors.black45,
                  elevation: 5,
                ),
                onPressed: () => validateAndSave(context),
                child: const Text(
                  'Dodaj posiłek',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadowColor: Colors.black45,
                  elevation: 5,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Anuluj',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}