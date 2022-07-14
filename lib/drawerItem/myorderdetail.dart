import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:spicywhips/const/strings.dart';

import '../auth/login.dart';

class Myorderdetail extends StatelessWidget {
  const Myorderdetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    "Order Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/myorderdetail');
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Color(0xffF5F5F5),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Id: 12345',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('Delivered',
                                    style: TextStyle(color: Colors.green)),
                              ],
                            ),
                            Text(
                              "15th May 2021  -   09:10 PM",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff787878)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Thanks for using spicywhips - We hope to see you again",
                              style: TextStyle(
                                  color: Color(0xff787878), fontSize: 17),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Neha Singh",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                              'House No.- 55, Tirupati Apartment, Road no.-2, Vasant Vihar, New Delhi'),
                          Text("Mob.no- 3825062454")
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(15),
                      // decoration: BoxDecoration(
                      //     color: Color(0xffF5F5F5),
                      //     borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Shipment 1 of 1"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "3 Item(s) Delivered",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Package Delivered On"),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Mon, 3 Jan",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Products",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Column(
                    children: List.generate(
                        3,
                        (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  // Navigator.pushNamed(
                                  //     context, '/myorderdetail');
                                },
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: Color(0xffF5F5F5),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(children: [
                                        Container(
                                          width: 53,
                                          height: 64,
                                          child: Image.asset(
                                            "assets/Rectangle 28 (3).png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Green Cotton\n T-Shirt'),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Text(
                                                  'BUY AGAIN',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10),
                                                ))
                                          ],
                                        ),
                                        Spacer(
                                          flex: 1,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '$rupeeSymbol 1299',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              'DETAILS',
                                              style: TextStyle(fontSize: 12),
                                            )
                                          ],
                                        )
                                      ]),
                                      Row(
                                        children: [
                                          Text("Rate this product"),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            child: RatingBar.builder(
                                              initialRating: 0.0,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 20,
                                              ignoreGestures: false,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 1.0),
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                Navigator.pushNamed(
                                                    context, "/rateproduct",
                                                    arguments: {
                                                      'rate': "$rating"
                                                    });
                                                rating;
                                              },
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
