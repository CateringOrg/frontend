import 'package:catering_app/data/catering_company_data.dart';
import 'package:catering_app/model/catering_company_model.dart';

class CateringCompanyLogic {
  final CateringCompanyData data = CateringCompanyData();

  Future<List<CateringCompanyDTO>> getCompanies() async {
    try {
      return await data.fetchCompanies();
    } catch (e) {
      throw Exception('Failed to fetch companies: $e');
    }
  }
}
