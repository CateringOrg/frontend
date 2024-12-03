import 'package:flutter/material.dart';


class ClientOrderFormView extends StatefulWidget {
  const ClientOrderFormView({super.key});

  @override
  State<ClientOrderFormView> createState() => _ClientOrderFormViewState();
}

class _ClientOrderFormViewState extends State<ClientOrderFormView> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final telephoneController = TextEditingController();
  final emailController = TextEditingController();
  final firstCodeController = TextEditingController();
  final secondCodeController = TextEditingController();
  final thirdCodeController = TextEditingController();
  final fourthCodeController = TextEditingController();
  final fifthCodeController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();
  final infoController = TextEditingController();
  String? generalError;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    telephoneController.dispose();
    emailController.dispose();
    fifthCodeController.dispose();
    secondCodeController.dispose();
    thirdCodeController.dispose();
    fourthCodeController.dispose();
    fifthCodeController.dispose();
    cityController.dispose();
    addressController.dispose();
    infoController.dispose();
    super.dispose();
  }

  /*void validateAndSave(BuildContext context) {
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
  }*/

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(title: const Text("Dane adresowe")),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text("Imię"),
                      const SizedBox(height: 8),
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text("Nazwisko"),
                      const SizedBox(height: 8),
                      TextField(
                        controller: surnameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),

              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text("Telefon"),
                      const SizedBox(height: 8),
                      TextField(
                        controller: telephoneController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text("Email"),
                      const SizedBox(height: 8),
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),

              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text("Kod pocztowy"),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          TextField(
                            controller: firstCodeController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '',
                            ),
                          ),

                          TextField(
                            controller: secondCodeController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '',
                            ),
                          ),

                          Text("-"),

                          TextField(
                            controller: thirdCodeController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '',
                            ),
                          ),

                          TextField(
                            controller: fourthCodeController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '',
                            ),
                          ),

                          TextField(
                            controller: fifthCodeController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '',
                            ),
                          ),


                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  TextField(
                    controller: cityController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '',
                    ),
                  ),

                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("Ulica, Nr budynku/mieszkania"),
                  const SizedBox(height: 8),
                  TextField(
                    controller: addressController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("Uwagi dla kuriera"),
                  const SizedBox(height: 8),
                  TextField(
                    controller: infoController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Przejdź do płatności za zamówienie',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadowColor: Colors.black45,
                  elevation: 5,
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Przejdź do płatności za zamówienie',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}