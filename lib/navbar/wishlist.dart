import 'package:flutter/material.dart';

import "package:flutter/material.dart";
import 'package:lottie/lottie.dart';
import 'package:spicywhips/auth/login.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          backbutton(),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8,
            ),
            child: Text(
              "WISHLIST",
              style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
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
                4,
                (index) => WishlistProduct(),
              ))
        ],
      ),
    ));
  }
}

class WishlistProduct extends StatefulWidget {
  WishlistProduct({
    Key? key,
  }) : super(key: key);

  // int? wishindex = 0;

  @override
  State<WishlistProduct> createState() => _WishlistProductState();
}

class _WishlistProductState extends State<WishlistProduct> {
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
              child: Image.asset(
                "assets/Rectangle 30.png",
                height: 200,
                width: MediaQuery.of(context).size.width / 2 - 10,
              ),
            ),
            Positioned(top: 10, right: 10, child: Icon(Icons.close))
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
