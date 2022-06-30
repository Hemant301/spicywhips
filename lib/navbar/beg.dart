import "package:flutter/material.dart";
import 'package:lottie/lottie.dart';
import 'package:spicywhips/auth/login.dart';
import 'package:spicywhips/const/strings.dart';
import 'package:spicywhips/modal/productmodal.dart';

class MyBeg extends StatelessWidget {
  const MyBeg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                  left: 16,
                ),
                child: Text(
                  "SHOPPING CART",
                  style: TextStyle(
                      color: Colors.black,
                      // letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              // Column(
              //   children: [
              //     SizedBox(
              //       height: 30,
              //     ),

              //     Lottie.asset("assets/emptycart.json"),
              //     Center(
              //       child: Text(
              //         "Your cart is empty",
              //         style: TextStyle(
              //             color: Colors.black,
              //             // letterSpacing: 1,
              //             fontWeight: FontWeight.bold,
              //             fontSize: 18),
              //       ),
              //     ),
              //   ],
              // ),

              Column(
                children: List.generate(
                    productDitelData.length,
                    (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xffC4C4C4)),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                            width: 85,
                                            height: 121,
                                            child: Image.asset(
                                              productDitelData[index].image,
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.8,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                'Classic Cars A04 - Short sleeves unisex t- shirt'),
                                            Text(
                                              '₹ 27.99',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: themeRed),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 20,
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  child: Center(
                                                    child: Text(
                                                      "-",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Text("1"),
                                                ),
                                                Container(
                                                  width: 20,
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  child: Center(
                                                    child: Text(
                                                      "+",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Text(
                                              "Only Few Left",
                                              style: TextStyle(
                                                  color: Color(0xff403F3F)),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "2 Offer available",
                                                  style: TextStyle(
                                                      color: themeRed,
                                                      fontSize: 10),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "1 Offer available",
                                                  style: TextStyle(
                                                      color: themeRed,
                                                      fontSize: 10),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                              Positioned(
                                right: 0,
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Color(0xffF3F3F3),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Icon(Icons.delete)),
                              ),
                              Positioned(
                                right: 10,
                                bottom: 15,
                                child: Text(
                                  'Details',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              )
                            ],
                          ),
                        )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffC4C4C4))),
                  child: Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          decoration:
                              InputDecoration(hintText: "Enter promo code"),
                        ),
                      )),
                      Container(
                        height: 50,
                        width: 80,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: themeRed,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Apply',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sub Total',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text('$rupeeSymbol 2499.00')
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Fee',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text('$rupeeSymbol 200.00')
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text('$rupeeSymbol 2799.00')
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/checkout');
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: themeRed),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Checkout',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ]),
      ),
    );
  }
}
