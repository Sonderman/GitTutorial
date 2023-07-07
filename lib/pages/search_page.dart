import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:food_delivery_flutter_app/Components/GLobalVariables.dart';
import 'package:provider/provider.dart';
import '../models/NavigationNotifier.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late NavigationBarNotifier notifier;
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showSearch(
        context: context,
        delegate: CustomSearchDelegate(notifier: notifier),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationBarNotifier>(
      builder: (BuildContext context, not, Widget? child) {
        notifier = not;
        // ignore: avoid_print
        print(not.serviceIndex);
        return Scaffold(body: Container());
      },
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate({required this.notifier});
  NavigationBarNotifier notifier;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          notifier.pageIndex = 0;
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var meal in searchTerms[notifier.serviceIndex]) {
      if (meal.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(meal);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var meal in searchTerms[notifier.serviceIndex]) {
      if (meal.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(meal);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
