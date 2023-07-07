import 'package:flutter/material.dart';
import 'package:food_delivery_flutter_app/Components/GLobalVariables.dart';
import 'package:food_delivery_flutter_app/Components/grocery_item_tile.dart';
import 'package:food_delivery_flutter_app/models/favorite_model.dart';
import 'package:food_delivery_flutter_app/models/local_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PocketLocal extends StatelessWidget {
  const PocketLocal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              //child: Text("Good morning!"),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Text(
                "Let's order fresh items for you",
                style: GoogleFonts.notoSerif(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Divider(),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Fresh items",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
              child: Consumer2<LocalModel, FavoriteModel>(
                builder: (context, localNotifier, favoriteNotifier, child) {
                  return GridView.builder(
                    itemCount: localShopItems.length,
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.2,
                    ),
                    itemBuilder: (context, index) {
                      return GroceryItemTile(
                          itemMap: localShopItems[index],
                          onPressed: () {
                            localNotifier.addItemToCart(index);
                          });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
