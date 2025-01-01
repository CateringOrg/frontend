import 'package:catering_app/data/add_meal_data.dart';
import 'package:catering_app/model/company_api_proxy.dart';

import '../data/meal_data.dart';

abstract class ICateringCompanyAddMealLogic {
  void onSaveDataClicked(AddMealDTO data);
}

abstract class ICateringCompanyShowOffersListLogic {
  void onShowAddMealFormClicked();
  void onShowListOfOffersClicked();
  void onShowUpdateMealFormClicked(String id);
}

abstract class ICateringCompanyEditMealLogic {
  void onSaveDataClicked(String mealId, AddMealDTO data);
}

abstract class ICateringCompanyOffersUI {
  void showAddMealForm();
  void showEditMealForm(Meal? meal);
  void showListOfOffers(List<Meal>? meals);
  void navigateBack();
  void showSuccessMessage(String? message);
  void showErrorMessage(String? message);
}

abstract class ICateringCompanyAPI {
  Future<ApiResponse<void>> addMeal(AddMealDTO meal);
  Future<ApiResponse<List<Meal>>> getListOfMealsByCompany();
  Future<ApiResponse<Meal>> getMeal(String id);
  Future<ApiResponse<void>> updateMeal(String mealId, AddMealDTO meal);
}
