import 'package:catering_app/data/add_meal_data.dart';

abstract class ICateringCompanyOffersLogic {
  void onShowAddMealFormClicked();
  void onSaveDataClicked(AddMealDTO data);
  List<String> validateMealData(AddMealDTO data);
}

abstract class ICateringCompanyOffersUI {
  void showMealDataForm();
  void showSuccessMessage();
}