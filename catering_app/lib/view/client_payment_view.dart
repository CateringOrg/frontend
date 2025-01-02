import 'package:catering_app/controller/client_payement_controller.dart';
import 'package:catering_app/data/payement_data.dart';
import 'package:catering_app/interfaces/client_payement.dart';
import 'package:flutter/material.dart';

import '../assets/colors.dart';

class ClientPaymentView extends StatefulWidget {
  final String? orderId;
  const ClientPaymentView({super.key, this.orderId});

  @override
  State<ClientPaymentView> createState() => _ClientPaymentViewState();
}

class _ClientPaymentViewState extends State<ClientPaymentView> {
  late final PayementDTO data;
  final controller = ClientPayementLogic();

  @override
  void initState() {
    super.initState();
    data = PayementDTO(
      paymentMethod: 'mock',
      orderId: widget.orderId!,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: Text(
                  "Płatność",
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(color: Colors.grey, thickness: 1.0),
              Center(
                child: Text(
                  "Czy chcesz zapłacić za to zamówienie?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 60, 0, 50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>
                            controller.onPayClicked(context, data),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.fontEmphasis,
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          "Zapłać",
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
                        onPressed: () => controller.onCancelClicked(context),
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
