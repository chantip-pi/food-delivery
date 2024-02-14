
import 'package:food_delivery/models/food_model.dart';


class CartModel {
  final int id;
  final Food product;
  int quantity;

  CartModel({
    required this.product,
    required this.quantity,
    required this.id,
  });
}

