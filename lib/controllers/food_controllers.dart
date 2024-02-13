import 'package:food_delivery/models/food_model.dart';

class FoodController {
  List<Food> getFoodList() {
    return [
      Food(
        id:1,
          name: "Ceasar salad",
          prepTime: 3,
          price: 5,
          image: "ceasar-salad.jpg"),
      Food(
        id: 2,
          name: "Creme Brulee",
          prepTime: 30,
          price: 10.99,
          image: "creme-brulee.jpg"),
      Food(
        id: 3,
          name: "Garlic Bread",
          prepTime: 10,
          price: 6.15,
          image: "garlic-bread.jpg"),
      Food(
        id: 4,
          name: "Grilled Salmon",
          prepTime: 15,
          price: 20.99,
          image: "grilled-salmon.jpg"),
      Food(
        id: 5,
          name: "Grilled Steak",
          prepTime: 20,
          price: 29.99,
          image: "grilled-steak.jpg"),
      Food(
        id: 6,
        name: "Lazania", 
      prepTime: 30, 
      price: 10.15, 
      image: "lazania.jpg"),
    ];
  }
}
