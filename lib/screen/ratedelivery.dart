import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth/login.dart';

class Ratedelivery extends StatefulWidget {
  const Ratedelivery({Key? key}) : super(key: key);

  @override
  State<Ratedelivery> createState() => _RatedeliveryState();
}

class _RatedeliveryState extends State<Ratedelivery> {
  double rating = 5.0;
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
                      decoration: BoxDecoration(
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "How was your delivery experience with Bluedartdelivery?",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Very poor"), Text("Excellent")],
                          ),
                          Slider.adaptive(
                              activeColor: Colors.green,
                              divisions: 5,
                              min: 0,
                              max: 10,
                              value: rating,
                              onChanged: (i) {
                                print(i);
                                setState(() {
                                  rating = i;
                                });
                              }),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 68, 68, 68)),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              maxLength: null,
                              maxLines: 4,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Please share your feedback",
                                  hintStyle: TextStyle(fontSize: 12)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Color(0xff00A410),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                "Submit",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
