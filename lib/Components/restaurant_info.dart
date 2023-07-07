import 'package:flutter/material.dart';
import 'package:food_delivery_flutter_app/constants.dart';
import 'package:food_delivery_flutter_app/models/favorite_model.dart';
import 'package:food_delivery_flutter_app/models/food_model.dart';
import 'package:provider/provider.dart';

class RestaurantInfoCart extends StatefulWidget {
  const RestaurantInfoCart(
      {Key? key,
      required this.index,
      required this.isMeal,
      required this.itemMap})
      : super(key: key);

  final bool isMeal;
  final int index;
  final Map<String, dynamic> itemMap;

  @override
  State<RestaurantInfoCart> createState() => _RestaurantInfoCartState();
}

class _RestaurantInfoCartState extends State<RestaurantInfoCart> {
  bool isliked = false;

  @override
  Widget build(BuildContext context) {
    String itemName = widget.itemMap["name"];
    String imagePath = widget.itemMap["image"];
    String itemLocation = widget.itemMap["location"];
    int itemDeliveryTime = widget.itemMap["deliveryTime"];
    String itemPrice = "";
    String itemRating = "";

    if (widget.isMeal) {
      itemPrice = widget.itemMap["prize"].toString();
    } else {
      itemRating = widget.itemMap["rating"].toString();
    }

    double width = 0;
    double height = 0;
    if (widget.isMeal) {
      width = MediaQuery.of(context).size.width * 0.4;
      height = MediaQuery.of(context).size.height * 0.14;
    } else {
      width = MediaQuery.of(context).size.width * 0.85;
      height = MediaQuery.of(context).size.height * 0.3;
    }
    isliked = Provider.of<FavoriteModel>(context, listen: false)
        .checkIfLiked(widget.itemMap);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ]),
      width: width,
      //height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: width,
            height: height,
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          Text(
            itemName,
            maxLines: 1,
          ),
          Text(
            itemLocation,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: kBodyTextColor),
          ),
          Padding(
            padding: const EdgeInsets.only(top: defaultPadding / 4),
            child: DefaultTextStyle(
              style: const TextStyle(color: Colors.black, fontSize: 12),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding / 2,
                        vertical: defaultPadding / 8),
                    decoration: BoxDecoration(
                      color: kActiveColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      widget.isMeal ? itemPrice : itemRating,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const Spacer(),
                  Visibility(
                    visible: widget.isMeal,
                    child: IconButton(
                        onPressed: () {
                          Provider.of<FoodModel>(context, listen: false)
                              .addItemToCart(widget.index);
                        },
                        icon: const Icon(Icons.trolley)),
                  ),
                  Visibility(
                    visible: widget.isMeal,
                    child: IconButton(
                        onPressed: () {
                          Provider.of<FavoriteModel>(context, listen: false)
                              .likeButtonToggled(widget.itemMap);
                          setState(() {
                            isliked = !isliked;
                          });
                        },
                        icon: Icon(
                            isliked ? Icons.favorite : Icons.favorite_border,
                            color: Colors.red)),
                  ),
                  const Spacer(),
                  Text("$itemDeliveryTime min"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
