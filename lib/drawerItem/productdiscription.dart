import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:spicywhips/const/color.dart';

class ProductDiscription extends StatefulWidget {
  ProductDiscription({Key? key}) : super(key: key);

  @override
  State<ProductDiscription> createState() => _ProductDiscriptionState();
}

class _ProductDiscriptionState extends State<ProductDiscription> {
  int pageIndex = 0;

  List image = ["assets/Rectangle 25.png", "assets/Rectangle 30.png"];
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
            "Product",
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
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 25,
                width: MediaQuery.of(context).size.width,
                color: Color(0xffF0F0F0),
                child: Center(child: Text("Free shipping above ₹2000")),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      // height: 300,
                      child: PageView(
                        onPageChanged: (i) {
                          print(i);
                          setState(() {
                            pageIndex = i;
                          });
                        },
                        children: List.generate(
                          image.length,
                          (index) => Image.asset(
                            image[index], height: 200,
                            width: MediaQuery.of(context).size.width - 20,
                            fit: BoxFit.contain,

                            // fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          image.length,
                          (index) => Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: pageIndex == index
                                          ? Colors.red
                                          : Colors.grey),
                                ),
                              )),
                    ),
                  ]),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 30,
                        child: Text(
                          "Classic Cars A09",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 30,
                        child: Text(
                          "Short sleeves uisex t-shirt",
                          style: TextStyle(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 30,
                        child: Text(
                          "27.99 USD",
                          style: TextStyle(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              rating;
                            },
                          ),
                          Text(
                            "(140 reviews)",
                            style: TextStyle(
                                color: Colors.black,
                                // fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 30,
                        child: Text(
                          "Colour:",
                          style: TextStyle(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            color: Color.fromARGB(255, 17, 18, 18),
                            height: 25,
                            width: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            color: Colors.blue,
                            height: 25,
                            width: 25,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 30,
                        child: Text(
                          "Size:",
                          style: TextStyle(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            // color: Color.fromARGB(255, 17, 18, 18),
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Text(
                                "S",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            // color: Color.fromARGB(255, 17, 18, 18),
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Text(
                                "M",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            // color: Color.fromARGB(255, 17, 18, 18),
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Text(
                                "XL",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "/navigationbar");
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width - 120,
                              height: 50,
                              color: red,
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 193, 152, 156),
                                  border: Border.all(color: Colors.grey)),
                              height: 50,
                              width: 45,
                              child: Icon(Icons.favorite_border)),
                        ],
                      ),
                    ],
                  ))
            ]));
  }
}
