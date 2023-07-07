import 'package:flutter/material.dart';
import 'package:food_delivery_flutter_app/models/favorite_model.dart';
import 'package:provider/provider.dart';

class GroceryItemTile extends StatefulWidget {
  final void Function()? onPressed;
  final Map<String, dynamic> itemMap;
  const GroceryItemTile(
      {super.key, required this.itemMap, required this.onPressed});

  @override
  State<GroceryItemTile> createState() => _GroceryItemTileState();
}

class _GroceryItemTileState extends State<GroceryItemTile> {
  bool isliked = false;
  @override
  Widget build(BuildContext context) {
    String itemName = widget.itemMap["name"];
    String itemPrice = widget.itemMap["prize"].toString();
    String imagePath = widget.itemMap["image"];
    int colorValue = widget.itemMap["colorARGB"];
    int colorPrice = widget.itemMap["colorPrize"];

    isliked = Provider.of<FavoriteModel>(context, listen: false)
        .checkIfLiked(widget.itemMap);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(colorValue),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
              child: Image.asset(
                imagePath,
                fit: BoxFit.fill,
              ),
            ),
            Text(itemName),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Color(colorPrice),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      '\$$itemPrice',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: widget.onPressed,
                    icon: const Icon(Icons.trolley)),
                IconButton(
                    onPressed: () {
                      Provider.of<FavoriteModel>(context, listen: false)
                          .likeButtonToggled(widget.itemMap);
                      setState(() {
                        isliked = !isliked;
                      });
                    },
                    icon: Icon(
                      isliked ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
