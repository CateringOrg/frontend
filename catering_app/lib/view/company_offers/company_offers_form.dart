import 'package:catering_app/controller/company_offers_logic/add_meal_logic.dart';
import 'package:catering_app/controller/company_offers_logic/edit_meal_logic.dart';
import 'package:catering_app/data/meal_data.dart';
import 'package:flutter/material.dart';
import 'package:catering_app/data/add_meal_data.dart';

class MealFormView extends StatefulWidget {
  final Meal? initialMeal;

  const MealFormView({super.key, this.initialMeal});

  @override
  State<MealFormView> createState() => _MealFormViewState();
}

class _MealFormViewState extends State<MealFormView> {
  late final AddMealDTO formData;

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final photoUrlController = TextEditingController();
  String? generalError;

  @override
  void initState() {
    super.initState();

    formData = AddMealDTO(
      name: widget.initialMeal?.name ?? '',
      description: widget.initialMeal?.description ?? '',
      price: widget.initialMeal?.price.toString() ?? '',
      photoUrl: widget.initialMeal?.photoUrls ?? '',
    );

    nameController.text = formData.name;
    descriptionController.text = formData.description;
    priceController.text = formData.price;
    photoUrlController.text = formData.photoUrl;

    nameController.addListener((){
      formData.name = nameController.text;
    });
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
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    photoUrlController.dispose();
    super.dispose();
  }

  void validateAndSave(BuildContext context) {
    final addMealLogic = CateringCompanyAddMealLogic(context);
    final editMealLogic = CateringCompanyEditMealLogic(context);
    setState(() {
      generalError = null;

      final errors = <String>[];

      if (formData.name.isEmpty) {
        errors.add("Nazwa nie może być pusta.");
      }
      if (formData.description.isEmpty) {
        errors.add("Opis nie może być pusty.");
      }
      if (formData.price.isEmpty) {
        errors.add("Cena nie może być pusta.");
      } else if (double.tryParse(formData.price) == null) {
        errors.add("Cena musi być poprawną liczbą.");
      }

      if (errors.isNotEmpty) {
        generalError = errors.join("\n");
        return;
      }

      if (widget.initialMeal == null) {
        addMealLogic.onSaveDataClicked(formData);
      } else {
        editMealLogic.onSaveDataClicked(widget.initialMeal!.id, formData);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
          title: Text(
              widget.initialMeal == null ? "Dodaj posiłek" : "Edytuj posiłek")),
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
              const SizedBox(height: 10),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text("Nazwa"),
                        const SizedBox(height: 8),
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Posiłek 123',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    flex: 1,
                    child: Column(
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
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("Opis"),
                  const SizedBox(height: 8),
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'danie z rybą',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("URL zdjęcia"),
                  const SizedBox(height: 6),
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
              const SizedBox(height: 10),
              Container(
                height: 160,
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadowColor: Colors.black45,
                  elevation: 5,
                ),
                onPressed: () => validateAndSave(context),
                child: Text(
                  widget.initialMeal == null
                      ? 'Dodaj posiłek'
                      : 'Edytuj posiłek',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
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
