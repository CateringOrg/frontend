import 'package:catering_app/model/catering_company_model.dart';

class CateringCompanyData {
  Future<List<CateringCompanyDTO>> fetchCompanies() async {
    // Symulacja Odpowiedzi API
    await Future.delayed(const Duration(seconds: 1));

    return [
      CateringCompanyDTO(
        id: '1',
        name: 'Food Express',
        address: '123 Main Street',
        phoneNumber: '+48 123 456 789',
      ),
      CateringCompanyDTO(
        id: '2',
        name: 'Quick Bites',
        address: '456 Poznanska Street',
        phoneNumber: '+48 987 654 321',
      ),
      CateringCompanyDTO(
        id: '3',
        name: 'Gourmet Delight',
        address: '789 Lisciana Avenue',
        phoneNumber: '+48 111 222 333',
      ),
    ];
  }
}
