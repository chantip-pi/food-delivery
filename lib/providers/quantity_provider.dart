
import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_model.dart';

class FoodQuantity extends ChangeNotifier {
  final List<Food> _foods = [];

  List<Food> get foods => _foods;

  void addToOrder(Food food) {
    _foods.add(food);
    notifyListeners();
  }

  void removeFromOrder(Food food) {
    _foods.remove(food);
    notifyListeners();
  }
}
