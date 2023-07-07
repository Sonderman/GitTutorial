import 'package:flutter/material.dart';
import 'package:food_delivery_flutter_app/Components/GLobalVariables.dart';

class FoodModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  get cartItems => _cartItems;

  //to add items to the cart function
  void addItemToCart(int index) {
    _cartItems.add(mealsCartData[index]);
    notifyListeners();
  }

  //to remove items from the cart function
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
  void removeItemFromCartByName(String name) {
    int i = 0;
    for (Map<String, dynamic> element in _cartItems) {
      if (element["name"] == name) {
        break;
      }
      i++;
    }
    _cartItems.removeAt(i);
    notifyListeners();
  }

  //to calculate total price function
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += _cartItems[i]["prize"];
    }

    return totalPrice.toStringAsFixed(2);
  }
}
