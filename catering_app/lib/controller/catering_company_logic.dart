import 'package:catering_app/model/catering_company_model.dart';
import 'package:catering_app/model/company_api_proxy.dart';

class CateringCompanyLogic {
  final CateringCompanyAPIProxy data = CateringCompanyAPIProxy();

  Future<ApiResponse<List<CateringCompanyDTO>>> getCompanies() async {
    try {
      return await data.getCateringCompanies();
    } catch (e) {
      throw Exception('Failed to fetch companies: $e');
    }
  }
}
