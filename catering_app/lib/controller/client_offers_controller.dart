import 'package:catering_app/interfaces/client_offers.dart';
import 'package:catering_app/model/catering_model.dart';
import 'package:catering_app/data/meal_data.dart';

class ClientOffersLogic implements IClientOffersLogic {
  final CateringModel model = CateringModel();

  @override
  Future<List<Meal>> fetchOffers() async {
    /*return await model.getAllMeals();*/
    await Future.delayed(Duration(seconds: 1));
    return [
      Meal(
        id: "1",
        description: "Poke bowl - 1",
        price: 25.60,
        imageUrl:
            "https://www.feastingathome.com/wp-content/uploads/2024/01/ahi-poke-5.jpg",
      ),
      Meal(
        id: "2",
        description: "Poke bowl - 2",
        price: 25.60,
        imageUrl:
            "https://www.feastingathome.com/wp-content/uploads/2024/01/ahi-poke-5.jpg",
      ),
      Meal(
        id: "3",
        description: "Poke bowl - 3",
        price: 25.60,
        imageUrl:
            "https://static01.nyt.com/images/2024/01/05/multimedia/ND-Poke-bowl-bfwm/ND-Poke-bowl-bfwm-superJumbo.jpg",
      ),
      Meal(
          id: "4",
          description: "Poke bowl - 4",
          price: 25.60,
          imageUrl:
              "https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/1bf4aa25-a9b5-4f69-88f2-00561c88e468/Derivates/f85016b7-2c01-466c-a668-ab75eff4de1e.jpg"),
    ];
  }

  @override
  Future<Map<String, dynamic>> addMealToCart(
      String mealId, String userId) async {
    //return await model.addMealToCart(mealId, userId);
    return {"success": true};
    //return {"success": false, "message": "Failed to connect to the server."};
  }
}
