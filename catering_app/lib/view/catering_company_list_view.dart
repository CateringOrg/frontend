import 'package:flutter/material.dart';
import 'package:catering_app/controller/catering_company_logic.dart';
import 'package:catering_app/model/catering_company_model.dart';

class CateringCompanyListView extends StatefulWidget {
  const CateringCompanyListView({super.key}); // Added const constructor

  @override
  State<CateringCompanyListView> createState() => _CateringCompanyListViewState();
}

class _CateringCompanyListViewState extends State<CateringCompanyListView> {
  late CateringCompanyLogic controller;
  late Future<List<CateringCompanyDTO>> companiesFuture;

  @override
  void initState() {
    super.initState();
    controller = CateringCompanyLogic();
    companiesFuture = controller.getCompanies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firmy Cateringowe')),
      body: FutureBuilder<List<CateringCompanyDTO>>(
        future: companiesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load companies.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No companies available.'));
          }

          final companies = snapshot.data!;

          return ListView.builder(
            itemCount: companies.length,
            itemBuilder: (context, index) {
              final company = companies[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                elevation: 2,
                child: ListTile(
                  title: Text(company.name),
                  subtitle: Text('${company.address}\nNr. Telefonu: ${company.phoneNumber}'),
                  isThreeLine: true,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Selected: ${company.name}')),
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
