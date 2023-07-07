import 'package:flutter/material.dart';
import 'package:food_delivery_flutter_app/models/favorite_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FavoriteModel>(
        builder: (context, favoriteNotifier, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "My Favorites",
                  style: GoogleFonts.notoSerif(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: favoriteNotifier.favoriteItems.length,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            favoriteNotifier.favoriteItems[index]["image"],
                            height: 36,
                          ),
                          title: Text(
                              favoriteNotifier.favoriteItems[index]["name"]),
                          subtitle: Text(
                              '\$${favoriteNotifier.favoriteItems[index]["prize"]}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.cancel),
                            onPressed: () => favoriteNotifier
                                .removeItemFromFavoriteCart(index),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
