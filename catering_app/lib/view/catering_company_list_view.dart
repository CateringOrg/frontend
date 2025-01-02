import 'package:flutter/material.dart';
import 'package:catering_app/model/catering_company_model.dart';
import 'package:catering_app/model/company_api_proxy.dart';

class CateringCompanyListView extends StatefulWidget {
  const CateringCompanyListView({super.key});

  @override
  State<CateringCompanyListView> createState() =>
      _CateringCompanyListViewState();
}

class _CateringCompanyListViewState extends State<CateringCompanyListView> {
  final CateringCompanyAPIProxy _apiProxy = CateringCompanyAPIProxy();
  late Future<List<CateringCompanyDTO>> companiesFuture;

  @override
  void initState() {
    super.initState();
    companiesFuture = _loadCateringCompanies();
  }

  Future<List<CateringCompanyDTO>> _loadCateringCompanies() async {
    final response = await _apiProxy.getCateringCompanies();

    if (response.success) {
      return response.data!;
    } else {
      throw Exception(response.error ?? 'Unknown error');
    }
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
            return const Center(child: Text('Nie udało się załadować danych.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text('Brak dostępnych firm cateringowych.'));
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
                  subtitle: Text(
                    'Adres: ${company.address}\n'
                    'NIP: ${company.nip}',
                  ),
                  isThreeLine: true,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Wybrano firmę: ${company.name}')),
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
