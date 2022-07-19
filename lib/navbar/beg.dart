import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:spicywhips/api/homeapi.dart';
import 'package:spicywhips/auth/login.dart';
import 'package:spicywhips/bloc/homebloc.dart';
import 'package:spicywhips/const/strings.dart';
import 'package:spicywhips/modal/productdetailmodal.dart';
import 'package:spicywhips/shimmer/shimmer.dart';

class MyBeg extends StatefulWidget {
  const MyBeg({Key? key}) : super(key: key);

  @override
  State<MyBeg> createState() => _MyBegState();
}

class _MyBegState extends State<MyBeg> {
  @override
  Widget build(BuildContext context) {
    homeBloc.fetchCartitems();
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder<CartModal>(
            stream: homeBloc.getcartitems.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Shimmer_cart();
              return Column(
                children: [
                  snapshot.data!.result.isEmpty
                      ? Center(
                          child: Column(
                            children: [
                              // Align(
                              //     alignment: Alignment.topLeft,
                              //     child: backbutton()),
                              SizedBox(
                                height: 100,
                              ),
                              Opacity(
                                opacity: 0.5,
                                child: Lottie.asset('assets/empty.json',
                                    height: 200, repeat: false),
                              ),
                              Text("No Items in your cart")
                            ],
                          ),
                        )
                      : Column(
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
                                    snapshot.data!.result.length,
                                    (index) => Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Stack(
                                            children: [
                                              Container(
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color(
                                                              0xffC4C4C4)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Row(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Container(
                                                            width: 85,
                                                            height: 121,
                                                            child:
                                                                Image.network(
                                                              snapshot
                                                                  .data!
                                                                  .result[index]
                                                                  .product!
                                                                  .photo[0]
                                                                  .img!,
                                                              fit: BoxFit.cover,
                                                            )),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            1.8,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(snapshot
                                                                .data!
                                                                .result[index]
                                                                .product!
                                                                .name!),
                                                            Text(
                                                              '₹ ${snapshot.data!.result[index].price!}',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color:
                                                                      themeRed),
                                                            ),
                                                            Row(
                                                              children: [
                                                                InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    if (snapshot
                                                                            .data!
                                                                            .result[index]
                                                                            .quantity ==
                                                                        1) {
                                                                      return;
                                                                    }
                                                                    HomeApi
                                                                        _api =
                                                                        HomeApi();
                                                                    Map data = await _api.ChangeQty(
                                                                        id: snapshot
                                                                            .data!
                                                                            .result[
                                                                                index]
                                                                            .id!,
                                                                        qty: snapshot.data!.result[index].quantity -
                                                                            1);
                                                                    if (data['status']
                                                                            .toString() ==
                                                                        "200") {
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 20,
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.5),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        "-",
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          5.0),
                                                                  child: Text(
                                                                      "${snapshot.data!.result[index].quantity}"),
                                                                ),
                                                                InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    HomeApi
                                                                        _api =
                                                                        HomeApi();
                                                                    Map data = await _api.ChangeQty(
                                                                        id: snapshot
                                                                            .data!
                                                                            .result[
                                                                                index]
                                                                            .id!,
                                                                        qty: snapshot.data!.result[index].quantity +
                                                                            1);
                                                                    if (data['status']
                                                                            .toString() ==
                                                                        "200") {
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 20,
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.5),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        "+",
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            Text(
                                                              "Only Few Left",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff403F3F)),
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "2 Offer available",
                                                                  style: TextStyle(
                                                                      color:
                                                                          themeRed,
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(
                                                                  "1 Offer available",
                                                                  style: TextStyle(
                                                                      color:
                                                                          themeRed,
                                                                      fontSize:
                                                                          10),
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
                                                child: InkWell(
                                                  onTap: () async {
                                                    HomeApi _api = HomeApi();
                                                    Map data = await _api
                                                        .deletecartItems(
                                                            snapshot
                                                                .data!
                                                                .result[index]
                                                                .id);
                                                    if (data['status']
                                                            .toString() ==
                                                        "200") {
                                                      setState(() {
                                                        homeBloc
                                                            .fetchCartitems();
                                                      });
                                                      Fluttertoast.showToast(
                                                          msg: data['message']);
                                                    }
                                                  },
                                                  child: Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffF3F3F3),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                        ),
                                                      ),
                                                      child:
                                                          Icon(Icons.delete)),
                                                ),
                                              ),
                                              Positioned(
                                                right: 10,
                                                bottom: 15,
                                                child: Text(
                                                  'Details',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                      border:
                                          Border.all(color: Color(0xffC4C4C4))),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              hintText: "Enter promo code"),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Sub Total',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Text(
                                            '$rupeeSymbol ${snapshot.data!.total[0].total}')
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Delivery Fee',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Text('$rupeeSymbol 00.')
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Total',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Text(
                                            '$rupeeSymbol ${snapshot.data!.total[0].total}')
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                ],
              );
            }),
      ),
    );
  }
}
