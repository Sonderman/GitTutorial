// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:food_delivery_flutter_app/Components/GLobalVariables.dart';
import 'package:food_delivery_flutter_app/Components/restaurant_info.dart';
import 'package:food_delivery_flutter_app/Components/section_tile.dart';
import 'package:food_delivery_flutter_app/Styles/appstyle.dart';
import 'package:food_delivery_flutter_app/constants.dart';

class PocketFood extends StatefulWidget {
  const PocketFood({Key? key}) : super(key: key);

  @override
  _PocketFoodState createState() => _PocketFoodState();
}

class _PocketFoodState extends State<PocketFood> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("Assets/images/etlimanty.jpg"),
                          fit: BoxFit.fill),
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(left: 8, bottom: 15),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Text(
                              "Delicous meals",
                              style: appstyleWithHt(
                                  size: 24,
                                  color: Colors.purpleAccent,
                                  fw: FontWeight.bold,
                                  ht: 1.5),
                            ),
                          ),
                          Text(
                            " Fast and affordable delivery prices",
                            style: appstyleWithHt(
                                size: 22,
                                color: Colors.white,
                                fw: FontWeight.bold,
                                ht: 1.2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            sliver: SliverToBoxAdapter(
              child: SectionTile(
                title: "Canan",
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  mealsCartData.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(
                        left: defaultPadding,
                        bottom: defaultPadding,
                        top: defaultPadding),
                    child: RestaurantInfoCart(
                      isMeal: true,
                      index: index,
                      itemMap: mealsCartData[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            sliver: SliverToBoxAdapter(
              child: SectionTile(
                title: "Restaurants",
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            sliver: SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    restaurantsCartData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(top: defaultPadding),
                      child: RestaurantInfoCart(
                        index: index,
                        isMeal: false,
                        itemMap: restaurantsCartData[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
