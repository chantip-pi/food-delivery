import 'package:food_delivery/models/food_model.dart';

class FoodController {
  List<Food> getFoodList() {
    return [
      Food(
          name: "Ceasar salad",
          prepTime: 3,
          price: 5,
          image: "ceasar-salad.jpg"),
      Food(
          name: "Creme Brulee",
          prepTime: 30,
          price: 10.99,
          image: "creme-brulee.jpg"),
      Food(
          name: "Garlic Bread",
          prepTime: 10,
          price: 6.15,
          image: "garlic-bread.jpg"),
      Food(
          name: "Grilled Salmon",
          prepTime: 15,
          price: 20.99,
          image: "grilled-salmon.jpg"),
      Food(
          name: "Grilled Steak",
          prepTime: 20,
          price: 29.99,
          image: "grilled-steak.jpg"),
      Food(name: "Lazania", 
      prepTime: 30, 
      price: 10.15, 
      image: "lazania.jpg"),
    ];
  }
}
