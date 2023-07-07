import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoriteModel extends ChangeNotifier {
  List _favoriteItems = [];

  get favoriteItems => _favoriteItems;
  Box<Map>? hiveBox;
  FavoriteModel(Box<Map>? box) {
    hiveBox = box;
    bringItemsFromDatabase();
  }

  void bringItemsFromDatabase() {
    _favoriteItems = hiveBox!.values.toList();
  }

  void likeButtonToggled(Map<String, dynamic> item) {
    if (!_favoriteItems.every((element) => element["name"] != item["name"])) {
      _favoriteItems.remove(item);
      hiveBox!.delete(item["name"]);
    } else {
      addItemToFavoriteCart(item);
    }
  }

  bool checkIfLiked(Map<String, dynamic> item) {
    return !_favoriteItems.every((element) => element["name"] != item["name"]);
  }

  //to add items to the cart function
  void addItemToFavoriteCart(Map<String, dynamic> item) {
    _favoriteItems.add(item);
    hiveBox!.put(item["name"], item);
    notifyListeners();
  }

  //to remove items from the cart function
  void removeItemFromFavoriteCart(int index) {
    hiveBox!.delete(_favoriteItems[index]["name"]);
    _favoriteItems.removeAt(index);
    notifyListeners();
  }
}
