import "package:flutter/material.dart";
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:lottie/lottie.dart';
import 'package:spicywhips/auth/login.dart';

class WomneCat extends StatefulWidget {
  WomneCat({
    Key? key,
  }) : super(key: key);

  @override
  State<WomneCat> createState() => _WomneCatState();
}

class _WomneCatState extends State<WomneCat> {
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
                  children: List.generate(
                    10,
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
                                "assets/Ellipse 116.png",
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
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropDown(
                    showUnderline: false,
                    items: [1, 2, 3],
                    hint: Text("Sort"),
                    icon: Icon(
                      Icons.expand_more,
                      color: Colors.blue,
                    ),
                  ),
                  DropDown(
                    showUnderline: false,
                    items: [1, 2, 3],
                    hint: Text("Size"),
                    icon: Icon(
                      Icons.expand_more,
                      color: Colors.blue,
                    ),
                  ),
                  DropDown(
                    showUnderline: false,
                    items: [1, 2, 3],
                    hint: Text("Material"),
                    icon: Icon(
                      Icons.expand_more,
                      color: Colors.blue,
                    ),
                  ),
                  DropDown(
                    showUnderline: false,
                    items: [1, 2, 3],
                    hint: Text("Filter"),
                    icon: Icon(
                      Icons.expand_more,
                      color: Colors.blue,
                    ),
                  ),
                ],
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
                    4,
                    (index) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/productdiscription");
                      },
                      child: ProductList(),
                    ),
                  ))
            ],
          ),
        ));
  }
}

class ProductList extends StatefulWidget {
  ProductList({Key? key, this.iswishlis}) : super(key: key);

  // int? wishindex = 0;
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
                  Navigator.pushNamed(context, "/productdiscription");
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
                  "assets/Rectangle 30.png",
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
                top: 10,
                right: 10,
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
