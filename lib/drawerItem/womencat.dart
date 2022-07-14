import "package:flutter/material.dart";
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:lottie/lottie.dart';
import 'package:spicywhips/auth/login.dart';

// class WomneCat extends StatefulWidget {

// WomneCat
import "package:flutter/material.dart";
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:lottie/lottie.dart';
import 'package:spicywhips/auth/login.dart';
import 'package:spicywhips/const/color.dart';
import 'package:spicywhips/modal/productmodal.dart';

class WomneCat extends StatefulWidget {
  WomneCat({
    Key? key,
  }) : super(key: key);

  @override
  State<WomneCat> createState() => _WomneCatState();
}

class _WomneCatState extends State<WomneCat> {
  bool isOpen = false;

  var bottomSheetController;
  int activeman = 0;
  // final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/backarrow.png")),
        title: Text(
          "Women",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  productData[index].title,
                                  textAlign: TextAlign.center,
                                )))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isOpen = !isOpen;
                    });
                    print('tapped on the bottom sheet');
                    if (isOpen) {
                      bottomSheetController = showBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(builder: (BuildContext
                                    context,
                                StateSetter setState /*You can rename this!*/) {
                              return Container(
                                padding: EdgeInsets.all(20),
                                height: MediaQuery.of(context).size.width - 80,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "CHOOSE",
                                          style: TextStyle(
                                              color: red,
                                              letterSpacing: 1,
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (activeman == 0) {
                                              setState(() {
                                                activeman = 1;
                                              });
                                              print(activeman);
                                            }
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Women",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    letterSpacing: 1,
                                                    // fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              activeman == 0
                                                  ? Container(
                                                      padding:
                                                          EdgeInsets.all(12),
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color:
                                                              Colors.grey[300]),
                                                      // correct 1.png
                                                    )
                                                  : Container(
                                                      // padding: EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                        color: red,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      // correct 1.png
                                                      child: Icon(
                                                        Icons.done,
                                                        color: Colors.white,
                                                      ),
                                                    )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (activeman == 1) {
                                              setState(() {
                                                activeman = 0;
                                                print(activeman);
                                              });
                                            }
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Man",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    letterSpacing: 1,
                                                    // fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              activeman == 1
                                                  ? Container(
                                                      padding:
                                                          EdgeInsets.all(12),
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color:
                                                              Colors.grey[300]),
                                                      // correct 1.png
                                                    )
                                                  : Container(
                                                      // padding: EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                        color: red,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      // correct 1.png
                                                      child: Icon(
                                                        Icons.done,
                                                        color: Colors.white,
                                                      ),
                                                    )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context, "/");
                                          },
                                          child: Center(
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  120,
                                              height: 40,
                                              color: red,
                                              child: Center(
                                                child: Text(
                                                  "Done",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      letterSpacing: 1,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              );
                            });
                          });
                      bottomSheetController.closed.then((value) {
                        setState(() {
                          isOpen = !isOpen;
                        });
                      });
                    } else {
                      Navigator.of(context).pop();
                      setState(() {
                        isOpen = !isOpen;
                      });
                    }
                  },
                  child: Row(
                    children: [
                      Text('Sort'),
                      isOpen
                          ? Icon(Icons.arrow_drop_down)
                          : Icon(Icons.arrow_drop_up)
                    ],
                  ),
                ),
                Row(
                  children: [Text('Size'), Icon(Icons.arrow_drop_down)],
                ),
                Row(
                  children: [Text('Material'), Icon(Icons.arrow_drop_down)],
                ),
                Row(
                  children: [Text('Filter'), Icon(Icons.arrow_drop_down)],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GridView(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 8.5 / 13.6),
                shrinkWrap: true,
                // crossAxisCount: 2,
                // crossAxisSpacing: 1,
                // mainAxisSpacing: 10,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(
                  productDitelData.length,
                  (index) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/productdiscription",
                          arguments: {'id': "1"});
                    },
                    child: ProductList(
                      image: productDitelData[index].image,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class ProductList extends StatefulWidget {
  ProductList({Key? key, this.iswishlis, this.image}) : super(key: key);

  // int? wishindex = 0;
  String? image;
  bool? iswishlis;
  bool islike = false;
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/productdiscription",
                      arguments: {'id': "1"});
                },
                onDoubleTap: () {
                  setState(() {
                    widget.islike = true;
                  });
                  if (widget.iswishlis == false) {
                    setState(() {
                      widget.iswishlis = true;
                    });
                  } else {
                    setState(() {
                      widget.iswishlis = false;
                    });
                  }
                  Future.delayed(Duration(seconds: 1), () {
                    setState(() {
                      widget.islike = false;
                    });
                  });
                },
                child: Image.asset(
                  widget.image!,
                  height: 200,
                  width: MediaQuery.of(context).size.width / 2 - 10,
                ),
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: widget.islike == false
                    ? Container()
                    : Lottie.asset(
                        "assets/fav.json",
                      )),
            Positioned(
                top: 20,
                right: 20,
                child: widget.iswishlis == false
                    ? Icon(Icons.favorite_border)
                    : Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2 - 10,
                child: Text(
                  "Classic Cars A09",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2 - 10,
                child: Text(
                  "Short sleeves uisex t-shirt",
                  style: TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 11),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2 - 10,
                child: Text(
                  "27.99 USD",
                  style: TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 11),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    color: Color.fromARGB(255, 17, 18, 18),
                    height: 15,
                    width: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    color: Colors.blue,
                    height: 15,
                    width: 15,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
