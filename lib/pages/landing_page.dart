import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food_delivery_flutter_app/Screens/pocket_food.dart';
import 'package:food_delivery_flutter_app/Screens/pocket_jobs.dart';
import 'package:food_delivery_flutter_app/Screens/pocket_local.dart';
import 'nested_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List pictures = [
    'Assets/images/delive.jpg',
    'Assets/images/bannerads.jpg',
    'Assets/images/bannerads2.jpg',
    'Assets/images/banner.jpg',
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 200, 200, 200),

      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: pictures.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Image.asset(
                  pictures[index],
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                );
              },
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.3,
                //aspectRatio: 1,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(seconds: 1),
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlayCurve: Curves.easeOutQuint,
                onPageChanged: (i, reason) {
                  setState(() {
                    index = i;
                  });
                },
              ),
            ),
            DotsIndicator(
              dotsCount: pictures.length,
              position: index,
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.width * 0.1,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                hintText: "Search for...",
                                prefixIcon: Icon(Icons.search,
                                    color: Colors.deepPurple),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide:
                                      BorderSide(color: Colors.purple),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide:
                                      BorderSide(color: Colors.purple),
                                )),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => NestedPage(
                              title: "PocketFood",
                              page: const PocketFood(),
                              serviceIndex: 0,
                            ),
                          ),
                        );
                      },
                      child: homestacks(
                          height: MediaQuery.of(context).size.width * 0.45,
                          width: MediaQuery.of(context).size.width * 0.45,
                          text: "PocketFood",
                          image: "landing_food.jpg",
                          imageWidth: MediaQuery.of(context).size.width * 0.3,
                          imageHeight:
                              MediaQuery.of(context).size.height * 0.15,
                          border: 10),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => NestedPage(
                                    title: "PocketLocal",
                                    page: const PocketLocal(),
                                    serviceIndex: 1),
                              ),
                            );
                          },
                          child: homestacks(
                              height: MediaQuery.of(context).size.width * 0.2,
                              width: MediaQuery.of(context).size.width * 0.45,
                              text: "PocketLocal",
                              image: "landing_local.jpg",
                              imageWidth:
                                  MediaQuery.of(context).size.width * 0.15,
                              border: 10),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => NestedPage(
                                    title: "PocketJobs",
                                    page: const PocketJob(),
                                    serviceIndex: 2),
                              ),
                            );
                          },
                          child: homestacks(
                              height: MediaQuery.of(context).size.width * 0.2,
                              width: MediaQuery.of(context).size.width * 0.45,
                              text: "PocketJobs",
                              image: "landing_jobs.png",
                              imageWidth:
                                  MediaQuery.of(context).size.width * 0.15,
                              border: 10),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        homestacks(
                            height: MediaQuery.of(context).size.width * 0.2,
                            width: MediaQuery.of(context).size.width * 0.45,
                            text: "PocketMore",
                            image: "landing_more.png",
                            imageWidth:
                                MediaQuery.of(context).size.width * 0.15,
                            border: 10),
                        homestacks(
                            height: MediaQuery.of(context).size.width * 0.2,
                            width: MediaQuery.of(context).size.width * 0.45,
                            text: "Pocket",
                            image: "landing_pocket.png",
                            imageWidth:
                                MediaQuery.of(context).size.width * 0.15,
                            border: 10),
                      ],
                    ),
                    homestacks(
                        height: MediaQuery.of(context).size.width * 0.45,
                        width: MediaQuery.of(context).size.width * 0.45,
                        text: "PocketWater",
                        image: "landing_water.png",
                        imageWidth: MediaQuery.of(context).size.width * 0.3,
                        border: 10),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget homestacks(
      {String? text,
      required String image,
      required double imageWidth,
      double? imageHeight,
      required double height,
      required double width,
      required double border}) {
    String temp = text ?? "";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: height,
        width: width,
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.purple, width: 2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Stack(
            children: [
              Positioned(
                left: border,
                top: border,
                child: Text(
                  temp,
                  style: const TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                  bottom: border,
                  right: border,
                  child: Image.asset(
                    "Assets/images/$image",
                    fit: BoxFit.fill,
                    width: imageWidth,
                    height: imageHeight,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
