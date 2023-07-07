import 'package:flutter/material.dart';
import 'package:food_delivery_flutter_app/models/food_model.dart';
import 'package:food_delivery_flutter_app/models/local_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<FoodModel, LocalModel>(
        builder: (context, foodNotifier, localNotifier, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "My Cart",
                  style: GoogleFonts.notoSerif(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: foodNotifier.cartItems.length +
                      localNotifier.cartItems.length,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    List myCardItems =
                        foodNotifier.cartItems + localNotifier.cartItems;
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            myCardItems[index]["image"],
                            height: 36,
                          ),
                          title: Text(myCardItems[index]["name"]),
                          subtitle: Text('\$${myCardItems[index]["prize"]}'),
                          trailing: IconButton(
                              icon: const Icon(Icons.cancel),
                              onPressed: () {
                                if (myCardItems[index]["type"] == "local") {
                                  Provider.of<LocalModel>(context,
                                          listen: false)
                                      .removeItemFromCartByName(
                                          myCardItems[index]["name"]);
                                } else if (myCardItems[index]["type"] ==
                                    "food") {
                                  Provider.of<FoodModel>(context, listen: false)
                                      .removeItemFromCartByName(
                                          myCardItems[index]["name"]);
                                }
                                myCardItems.removeAt(index);
                              }),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total price',
                            style: TextStyle(color: Colors.green[100]),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            (double.parse(foodNotifier.calculateTotal()) +
                                    double.parse(
                                        localNotifier.calculateTotal()))
                                .toStringAsFixed(2),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green.shade100),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: const Row(
                          children: [
                            Text(
                              "Pay now",
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(Icons.arrow_forward,
                                size: 16, color: Colors.white),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
