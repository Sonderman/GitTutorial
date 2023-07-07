import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Like extends StatelessWidget {
  const Like({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List a = ["LEARN", 
    "READ",
     "ITIRATE",
      "PRACTICE", 
      "SEARCH"];
    return Scaffold(
        appBar: AppBar(
          title: const Text("Favorite App"),
        ),
        body: ValueListenableBuilder(
          valueListenable: Hive.box("favorites").listenable(),
          builder: (context, box, child) {
            return ListView.builder(
              itemCount: a.length,
              itemBuilder: (context, index) {
                final b = a[index];
                final isFavorite = box.get(index) != null;
                return ListTile(
                  title: Text(b),
                  trailing: IconButton(
                    onPressed: () async {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      if (isFavorite) {
                        await box.delete(index);
                        const snackBar = SnackBar(
                          content: Text("Removed Successfully"),
                          backgroundColor: Colors.red,
                        );

                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        await box.put(index, b);
                        const snackBar = SnackBar(
                          content: Text("Added Successfully"),
                          backgroundColor: Colors.blue,
                        );

                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
