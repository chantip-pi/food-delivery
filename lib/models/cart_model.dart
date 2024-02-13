import 'package:flutter/foundation.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/models/menu_model.dart';

 // Import your FoodProvider

class CartModel extends ChangeNotifier {
  late Menu _catalog;
// Add FoodProvider as a dependency

  final List<int> _itemIds = [];

  CartModel(); // Pass FoodProvider in the constructor

  Menu get catalog => _catalog;

  set catalog(Menu? newCatalog) {
    if (newCatalog == null) {
      throw ArgumentError.notNull('newCatalog');
    }
    _catalog = newCatalog;
    notifyListeners();
  }
  

  List<Food?> get items =>
      _itemIds.map((id) => _catalog.getFoodById(id)).toList();

  double get totalPrice => items.fold(0.0, (total, current) {
        return total + ((current!.price));
      });

// Use totalQuantity from FoodProvider

  void add(Food item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  void remove(Food item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }
}
