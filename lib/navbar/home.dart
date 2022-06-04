// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spicywhips/modal/productmodal.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: activeindex == 0 ? Colors.white : Color(0xffE5E5E5),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
              onTap: () {
                if (activeindex == 0) {
                  setState(() {
                    activeindex = 1;
                  });
                } else {
                  setState(() {
                    activeindex = 0;
                  });
                }
              },
              child: activeindex == 0
                  ? Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 30,
                    )
                  : Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 30,
                    )),
          title: Image.asset("assets/SWgradient20x_100x@2x 1.png"),
          actions: [
            Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Image.asset(
              "assets/bell (4) 2.png",
              height: 30,
              width: 30,
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: activeindex == 0
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  Container(
                    height: 25,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xffF0F0F0),
                    child: Center(child: Text("Free shipping above ₹2000")),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        productData.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffF0F0F0),
                                  ),
                                  child: Image.asset(
                                    productData[index].image,
                                    fit: BoxFit.contain,
                                  )),
                              Center(
                                  child: Container(
                                      width: 60,
                                      child: Text(
                                        "Classic Car 1",
                                        textAlign: TextAlign.center,
                                      )))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Brand(
                    title: "SPONSORED BRANDS",
                    image: "Rectangle 28 (1).png",
                  ),
                  Brand(
                    title: "ON DEMAND",
                    image: "Rectangle 28 (2).png",
                  ),
                  Brand(
                    title: "NEW COLLECTION",
                    image: "Rectangle 28 (3).png",
                  ) //Rectangle 28 (2).png
                ]),
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackButton(),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        // height: MediaQuery.of(context).size.height - 300,
                        width: MediaQuery.of(context).size.width - 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(children: [
                          DrawerItem(
                            name: "Home",
                            onTap: () {
                              if (activeindex == 0) {
                                setState(() {
                                  activeindex = 1;
                                });
                              } else {
                                setState(() {
                                  activeindex = 0;
                                });
                              }
                            },
                          ),
                          DrawerItem(
                            name: "Shop",
                            onTap: () {
                              Navigator.pushNamed(context, "/shop");
                            },
                          ),
                          DrawerItem(name: "Men"),
                          DrawerItem(
                            name: "Women",
                            onTap: () {
                              Navigator.pushNamed(context, "/womencat");
                            },
                          ),
                          DrawerItem(
                            name: "About Us",
                            onTap: () {
                              Navigator.pushNamed(context, "/aboutus");
                            },
                          ),
                          DrawerItem(
                            name: "Blog",
                            onTap: () {
                              Navigator.pushNamed(context, "/blog");
                            },
                          ),
                          DrawerItem(
                            name: "Contact us",
                            onTap: () {
                              Navigator.pushNamed(context, "/contactus");
                            },
                          ),
                          DrawerItem(
                            name: "Help",
                            onTap: () {
                              Navigator.pushNamed(context, "/help");
                            },
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              ));
  }
}

class DrawerItem extends StatelessWidget {
  DrawerItem({Key? key, this.onTap, this.name}) : super(key: key);
  Function()? onTap;
  String? name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name!,
                style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1,
                    // fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Icon(Icons.arrow_forward)
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Divider(
          height: 1,
          color: Colors.grey,
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

class Brand extends StatelessWidget {
  Brand({Key? key, this.title, this.image}) : super(key: key);

  String? title;
  String? image;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 20,
      ),
      Text(
        title!,
        style: TextStyle(
            color: Colors.black,
            // letterSpacing: 1,
            // fontWeight: FontWeight.bold,
            fontSize: 18),
      ),
      SizedBox(
        height: 20,
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            5,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffF0F0F0),
                  ),
                  child: Image.asset(
                    "assets/${image}",
                    fit: BoxFit.contain,
                  )),
            ),
          ),
        ),
      ),
    ]);
  }
}