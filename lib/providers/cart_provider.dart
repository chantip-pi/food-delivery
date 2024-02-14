import 'package:flutter/foundation.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/food_model.dart';



class CartProvider extends ChangeNotifier {
  final List<CartModel> _shoppingCart = [];


  void addToCart(Food product,quantity) {
    var isExist = _shoppingCart.where((element) => element.product.id == product.id);
    if (isExist.isEmpty) {
      _shoppingCart.add(CartModel(
        product: product,
        quantity: quantity,
        id: product.id
      ));
    } else {
      isExist.first.quantity += 1;
    }
    notifyListeners();
  }

  void removeItem(int productId) {
    _shoppingCart.removeWhere((element) => element.id == productId);
    notifyListeners();
  }

  void incrementQty(int productId) {
    CartModel item =
        _shoppingCart.where((element) => element.id == productId).first;
    item.quantity++;
    notifyListeners();
  }

  void decrimentQty(int productId) {
    CartModel item =
        _shoppingCart.where((element) => element.id == productId).first;

    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _shoppingCart.remove(item);
    }
    notifyListeners();
  }

  double getCartTotal() {
    double total = 0;
    for(var cartItem in _shoppingCart) {
      total += (cartItem.product.price * cartItem.quantity);
    }
    return total;
  }

  List<CartModel> get shoppingCart => _shoppingCart;
  int get cartLength => _shoppingCart.length;

  CartModel getItemById(int id) {
     var item = _shoppingCart.firstWhere(
    (element) => element.product.id == id,
  );
  return item;
}

}