
import 'package:food_delivery/controllers/food_controllers.dart';
import 'package:food_delivery/models/food_model.dart';

class Menu{
  List<Food> items = FoodController().getFoodList();

  Food? getFoodById(int id) {
   Food? foundFood = items.firstWhere((food) => food.id == id, orElse: () => throw Exception("Food with id $id not found"));

    return foundFood;
  }

}