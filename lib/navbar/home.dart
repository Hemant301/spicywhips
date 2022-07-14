// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:fl_toast/fl_toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spicywhips/bloc/homebloc.dart';
import 'package:spicywhips/const/blogslider.dart';
import 'package:spicywhips/const/slider.dart';
import 'package:spicywhips/const/testimonialSlider.dart';
import 'package:spicywhips/modal/homemodal.dart';
import 'package:spicywhips/modal/productmodal.dart';
import 'package:spicywhips/navbar/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController supcatScroller = ScrollController();
  List<String> reels = [
    'assets/dummy/kk.png',
    'assets/dummy/2.png',
    'assets/dummy/3.png'
  ];

  int activeindex = 0;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  GlobalKey previewContainer = new GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    homeBloc.fetchTestimomnial();
    homeBloc.fetchSlider();
    homeBloc.fetchCategory();
    homeBloc.fetchBlog();
    homeBloc.fetchCommercials();
    homeBloc.fetchHomeProduct();
    scrollCat();
    checkScroller();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => scrollCat());
    // timer = Timer.periodic(Duration(seconds: 15), (Timer t) => banner());
  }

  Timer? timer;

  double pixel = 0;
  void checkScroller() {
    supcatScroller.addListener(() {
      pixel = supcatScroller.position.pixels;

      if (supcatScroller.position.pixels ==
          supcatScroller.position.maxScrollExtent) {
        Future.delayed(Duration(seconds: 0), () {
          supcatScroller.animateTo(0,
              duration: Duration(seconds: 1), curve: Curves.easeOut);
        });
      }
    });
  }

  banner() async {
    await showAndroidToast(
      backgroundColor: Color(0xffEA919C),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=2000"),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Adarsh bought black tshirt from mumbai',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      context: context,
    );
  }

  scrollCat() {
    if (supcatScroller.hasClients) {
      supcatScroller.animateTo(pixel + 85,
          duration: Duration(seconds: 1), curve: Curves.easeOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        drawer: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: DrawersPage(),
        ),
        backgroundColor: activeindex == 0 ? Colors.white : Color(0xffE5E5E5),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
              onTap: () {
                scaffoldkey.currentState!.openDrawer();
                //   if (activeindex == 0) {
                //     setState(() {
                //       activeindex = 1;
                //     });
                //   } else {
                //     setState(() {
                //       activeindex = 0;
                //     });
                //   }
                // },
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
          title: Image.asset(
            "assets/SWgradient20x.png",
            height: 40,
            width: 100,
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/search');
              },
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/notification');
              },
              child: Image.asset(
                "assets/bell (4) 2.png",
                height: 30,
                width: 30,
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: SingleChildScrollView(
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
            StreamBuilder<CategoryModal>(
                stream: homeBloc.getCategory.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();
                  return SingleChildScrollView(
                    controller: supcatScroller,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        snapshot.data!.data.length,
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
                                  child: Image.network(
                                    snapshot.data!.data[index].categoryImage!,
                                    fit: BoxFit.contain,
                                  )),
                              Center(
                                  child: Container(
                                      width: 65,
                                      child: Text(
                                        snapshot.data!.data[index].name!,
                                        style: TextStyle(fontSize: 12),
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                      )))
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: 20,
            ),
            MyCorosule(),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            StreamBuilder<HomeProductModal>(
                stream: homeBloc.getHomeProduct.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  }
                  return Column(
                    children: List.generate(
                      snapshot.data!.products.length,
                      (index) => Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xffF0CC6D),
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                snapshot.data!.products[index].title!,
                                style: TextStyle(
                                    color: Colors.black,
                                    // letterSpacing: 1,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xffF0CC6D),
                                size: 20,
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                children: List.generate(
                              snapshot.data!.products[index].productList.length,
                              (i) => InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/productdiscription",
                                      arguments: {
                                        'id': snapshot.data!.products[index]
                                            .productList[i].id
                                      });
                                },
                                child: Brand(
                                  title: "SPONSORED",
                                  image: snapshot.data!.products[index]
                                      .productList[i].image[0].img,
                                ),
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Image.network(
                'https://img.freepik.com/free-psd/super-sale-banner_1393-365.jpg?1&t=st=1657619150~exp=1657619750~hmac=9951be15882efd88815a97e95340ef71282c2d799d1d98b1ba353536fb862a13&w=1060',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Color(0xffF0CC6D),
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "COMMERCIALS",
                  style: TextStyle(
                      color: Colors.black,
                      // letterSpacing: 1,
                      // fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.star,
                  color: Color(0xffF0CC6D),
                  size: 20,
                ),
              ],
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "Our Brands Collobrator",
              style: TextStyle(
                  color: Colors.black,
                  // letterSpacing: 1,
                  // fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(
              height: 12,
            ),
            StreamBuilder<CommercialModal>(
                stream: homeBloc.getHomeCommercial.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          snapshot.data!.data.length,
                          (index) => InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/commercial');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                          height: 260,
                                          width: 117,
                                          child: Image.network(
                                            snapshot.data!.data[index]
                                                .commercialImage!,
                                            fit: BoxFit.cover,
                                          )),
                                      Container(
                                        height: 260,
                                        width: 117,
                                        child: Image.asset(
                                          'assets/dummy/trans.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                          left: 10,
                                          bottom: 10,
                                          child: Icon(
                                            Icons.play_arrow,
                                            color: Colors.white,
                                            size: 25,
                                          ))
                                    ],
                                  ),
                                ),
                              )),
                    ),
                  );
                }),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(color: Colors.red),
              child: Text(
                'View More',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Color(0xffF0CC6D),
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "BLOGS",
                  style: TextStyle(
                      color: Colors.black,
                      // letterSpacing: 1,
                      // fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.star,
                  color: Color(0xffF0CC6D),
                  size: 20,
                ),
              ],
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
            SizedBox(
              height: 2,
            ),
            SizedBox(
              height: 10,
            ),
            BlogCorosule(),
            SizedBox(
              height: 25,
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Color(0xffF0CC6D),
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "TESTIMONIALS",
                  style: TextStyle(
                      color: Colors.black,
                      // letterSpacing: 1,
                      // fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.star,
                  color: Color(0xffF0CC6D),
                  size: 20,
                ),
              ],
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
            SizedBox(
              height: 2,
            ),
            SizedBox(
              height: 10,
            ),
            TestimonialSlider(),
            SizedBox(
              height: 10,
            )
          ]),
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
                    fontSize: 18),
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
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                // shape: BoxShape.circle,
                // color: Color(0xffF0F0F0),
                ),
            child: Image.network(
              "${image}",
              height: 200,
              width: 200,
              fit: BoxFit.contain,
            )),
      ),
    ]);
  }
}
