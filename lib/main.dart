import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'models/NavigationNotifier.dart';
import 'models/local_model.dart';
import 'models/favorite_model.dart';
import 'models/food_model.dart';
import 'pages/landing_page.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox<Map>("Favorites").then((box) {
    //print("hive is open :" + box.isOpen.toString());
    runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => NavigationBarNotifier()),
      ChangeNotifierProvider(create: (context) => LocalModel()),
      ChangeNotifierProvider(create: (context) => FoodModel()),
      ChangeNotifierProvider(create: (context) => FavoriteModel(box)),
    ], child: const MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pocket',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LandingPage(),
    );
  }
}
