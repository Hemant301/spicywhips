import 'package:flutter/material.dart';
import 'package:spicywhips/auth/login.dart';
import 'package:spicywhips/modal/productmodal.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                backbutton(),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Search",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            //background color of box
                            BoxShadow(
                              color: Color.fromARGB(255, 223, 223, 223),
                              blurRadius: 5.0, // soften the shadow
                              spreadRadius: 2.0, //extend the shadow
                              offset: Offset(
                                1.0, // Move to right 10  horizontally
                                5.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Search"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Popular Search",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        spacing: 5,
                        children: List.generate(
                          5,
                          (index) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              padding: EdgeInsets.all(11),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                'T- Shirts',
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "What\’s new",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(
                          productDitelData.reversed.length,
                          (index) => SliderBrand(
                            title: "SPONSORED BRANDS",
                            image:
                                productDitelData.reversed.toList()[index].image,
                          ),
                        )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Trending",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(
                          productDitelData.reversed.length,
                          (index) => SliderBrand(
                            title: "SPONSORED BRANDS",
                            image:
                                productDitelData.reversed.toList()[index].image,
                          ),
                        )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/mainfooter.png",
              width: MediaQuery.of(context).size.width,
              // height: 100,
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Container(
      //     child: Stack(
      //   children: [
      //     Row(
      //       children: [
      //         Image.asset(
      //           "assets/footerimg1.png",
      //           width: MediaQuery.of(context).size.width,
      //         )
      //       ],
      //     ),
      //     Positioned(
      //       bottom: 0,
      //       right: 0,
      //       child: Image.asset(
      //         "assets/fotterimg2.png",
      //         height: 90,
      //       ),
      //     ),
      //   ],
      // )),
    );
  }
}

class SliderBrand extends StatelessWidget {
  SliderBrand({Key? key, this.title, this.image}) : super(key: key);

  String? title;
  String? image;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                // shape: BoxShape.circle,
                // color: Color(0xffF0F0F0),
                ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/productdiscription');
              },
              child: Image.asset(
                "${image}",
                fit: BoxFit.contain,
              ),
            )),
      ),
    ]);
  }
}
