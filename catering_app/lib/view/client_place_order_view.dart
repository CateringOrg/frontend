import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../assets/colors.dart';


class ClientOrderFormView extends StatefulWidget {
  const ClientOrderFormView({super.key});

  @override
  State<ClientOrderFormView> createState() => _ClientOrderFormViewState();
}

class _ClientOrderFormViewState extends State<ClientOrderFormView> {
  final emailController = TextEditingController();
  final firstCodeController = TextEditingController();
  final secondCodeController = TextEditingController();
  final thirdCodeController = TextEditingController();
  final fourthCodeController = TextEditingController();
  final fifthCodeController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();
  final dateController = TextEditingController();
  final infoController = TextEditingController();
  String? generalError;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    emailController.dispose();
    fifthCodeController.dispose();
    secondCodeController.dispose();
    thirdCodeController.dispose();
    fourthCodeController.dispose();
    fifthCodeController.dispose();
    cityController.dispose();
    addressController.dispose();
    infoController.dispose();
    dateController.dispose();
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
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: const Text(
                  "Dane adresowe",
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(color: Colors.grey, thickness: 1.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Flexible(
                    flex:1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text("e-mail"),
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text("Data dowozu"),
                        TextField(
                          controller: addressController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 33),
                      const Text("Kod pocztowy"),
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                            child: TextField(
                              maxLength: 1,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              controller: firstCodeController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '',
                              ),
                            ),
                          ),

                          const SizedBox(width: 5),

                          SizedBox(
                            width: 40,
                            child: TextField(
                              maxLength: 1,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              controller: secondCodeController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '',
                              ),
                            ),
                          ),

                          SizedBox(width: 25,),

                          SizedBox(
                            width: 40,
                            child: TextField(
                              maxLength: 1,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              controller: thirdCodeController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '',
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          SizedBox(
                            width: 40,
                            child: TextField(
                              maxLength: 1,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              controller: fourthCodeController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '',
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          SizedBox(
                            width:40,
                            child: TextField(
                              maxLength: 1,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              controller: fifthCodeController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '',
                              ),
                            ),
                          ),


                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),

                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Miasto"),
                        TextField(
                          controller: cityController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '',
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 20),

                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text("Ulica, Nr budynku/mieszkania"),
                        TextField(
                          controller: addressController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '',
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 15),


              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text("Uwagi dla kuriera"),
                    TextField(
                      controller: infoController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '',
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.fontEmphasis,
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          "Przejdź do płatności za zamówienie",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                              color: AppColor.fontEmphasis, width: 2.0),
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          "Powrót",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColor.fontEmphasis,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}