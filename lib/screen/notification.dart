import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:spicywhips/auth/login.dart';
import 'package:spicywhips/modal/productmodal.dart';
import 'package:spicywhips/navbar/home.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "Notification",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: List.generate(
                          3,
                          (index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      //background color of box
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 223, 223, 223),
                                        blurRadius: 5.0, // soften the shadow
                                        spreadRadius: 2.0, //extend the shadow
                                        offset: Offset(
                                          1.0, // Move to right 10  horizontally
                                          5.0, // Move to bottom 10 Vertically
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 180,
                                        width: 428,
                                        child: Image.asset(
                                          'assets/notibanner.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Trendy tshirts to elevate your look",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                                "Trendy tshirts to elevate your look"),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "2 days ago",
                                              style: TextStyle(
                                                  color: Color(0xff787878)),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
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
      //   bottomNavigationBar: Container(
      //       child: Stack(
      //     children: [
      //       Row(
      //         children: [
      //           Image.asset(
      //             "assets/footerimg1.png",
      //             width: MediaQuery.of(context).size.width,
      //           )
      //         ],
      //       ),
      //       Positioned(
      //         bottom: 0,
      //         right: 0,
      //         child: Image.asset(
      //           "assets/fotterimg2.png",
      //           height: 90,
      //         ),
      //       ),
      //     ],
      //   )),
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
