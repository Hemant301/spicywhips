import "package:flutter/material.dart";
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:lottie/lottie.dart';
import 'package:spicywhips/auth/login.dart';
import 'package:spicywhips/modal/productmodal.dart';

class ShopPage extends StatefulWidget {
  ShopPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
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
            "Shop",
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
              Container(
                height: 25,
                width: MediaQuery.of(context).size.width,
                color: Color(0xffF0F0F0),
                child: Center(child: Text("Free shipping above ₹2000")),
              ),
              SizedBox(
                height: 20,
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
                        Navigator.pushNamed(context, "/shop");
                        print("hii bro");
                      },
                      child: ShopProductList(
                        image: productDitelData[index].image,
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}

class ShopProductList extends StatefulWidget {
  ShopProductList({Key? key, this.iswishlis, this.image}) : super(key: key);
  String? image;
  // int? wishindex = 0;
  bool? iswishlis;
  bool islike = false;
  @override
  State<ShopProductList> createState() => _ShopProductListState();
}

class _ShopProductListState extends State<ShopProductList> {
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
