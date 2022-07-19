import 'package:flutter/material.dart';

import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:spicywhips/api/homeapi.dart';
import 'package:spicywhips/auth/login.dart';
import 'package:spicywhips/bloc/homebloc.dart';
import 'package:spicywhips/const/strings.dart';
import 'package:spicywhips/modal/productmodal.dart';
import 'package:spicywhips/modal/wishListModal.dart';
import 'package:spicywhips/shimmer/shimmer.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  bool isLoader = false;
  @override
  Widget build(BuildContext context) {
    homeBloc.fetchWishlist();
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Stack(
        alignment: Alignment.center,
        children: [
          StreamBuilder<WishListModal>(
              stream: homeBloc.getWishList.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Shimmer_wishList());
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
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
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
                                      snapshot.data!.result.length,
                                      (index) => Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pushNamed(context,
                                                      "/productdiscription",
                                                      arguments: {
                                                        'id': snapshot
                                                            .data!
                                                            .result[index]
                                                            .product!
                                                            .id
                                                      });
                                                },
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8,
                                                          vertical: 5),
                                                      child: Image.network(
                                                        snapshot
                                                            .data!
                                                            .result[index]
                                                            .product!
                                                            .profile[0]
                                                            .img!,
                                                        height: 200,
                                                        width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2 -
                                                            10,
                                                      ),
                                                    ),
                                                    Positioned(
                                                        top: 25,
                                                        right: 15,
                                                        child: InkWell(
                                                          onTap: () async {
                                                            setState(() {
                                                              isLoader = true;
                                                            });
                                                            HomeApi _api =
                                                                HomeApi();
                                                            Map data = await _api
                                                                .removeWishList(
                                                                    snapshot
                                                                        .data!
                                                                        .result[
                                                                            index]
                                                                        .product!
                                                                        .id);
                                                            print(data);
                                                            if (data['status']
                                                                    .toString() ==
                                                                "200") {
                                                              Fluttertoast
                                                                  .showToast(
                                                                      msg: data[
                                                                          "message"]);
                                                              setState(() {
                                                                homeBloc
                                                                    .fetchWishlist();
                                                                isLoader =
                                                                    false;
                                                              });
                                                            } else {}
                                                          },
                                                          child: Container(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                      4),
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  shape: BoxShape
                                                                      .circle),
                                                              child: Icon(
                                                                Icons.close,
                                                                size: 15,
                                                              )),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width /
                                                                  2 -
                                                              10,
                                                      child: Text(
                                                        snapshot
                                                            .data!
                                                            .result[index]
                                                            .product!
                                                            .name!,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width /
                                                                  2 -
                                                              10,
                                                      child: Text(
                                                        snapshot
                                                            .data!
                                                            .result[index]
                                                            .product!
                                                            .desc!,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            // fontWeight: FontWeight.bold,
                                                            fontSize: 11),
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width /
                                                                  2 -
                                                              10,
                                                      child: Text(
                                                        "$rupeeSymbol ${snapshot.data!.result[index].product!.attr[0].price!}",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            // fontWeight: FontWeight.bold,
                                                            fontSize: 11),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Wrap(
                                                      spacing: 10,
                                                      children: List.generate(
                                                        snapshot
                                                            .data!
                                                            .result[index]
                                                            .product!
                                                            .attr
                                                            .length,
                                                        (c) => Container(
                                                          color: changeColor(
                                                              snapshot
                                                                  .data!
                                                                  .result[index]
                                                                  .product!
                                                                  .attr[c]
                                                                  .colorname),
                                                          height: 15,
                                                          width: 15,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          )))
                            ],
                          ),
                  ],
                );
              }),
          isLoader == false
              ? Container()
              : Lottie.asset('assets/loding.json',
                  frameRate: FrameRate(120), height: 150)
        ],
      ),
    ));
  }

  Color changeColor(c) {
    if (c == "red") {
      return Colors.red;
    } else if (c == "blue") {
      return Colors.blue;
    } else if (c == "black") {
      return Colors.black;
    } else if (c == "green") {
      return Colors.green;
    } else if (c == "orange") {
      return Colors.orange;
    } else if (c == "purple") {
      return Colors.purple;
    } else if (c == "yellow") {
      return Colors.yellow;
    } else if (c == "pink") {
      return Colors.pink;
    } else if (c == "grey") {
      return Colors.grey;
    } else if (c == "brown") {
      return Colors.brown;
    } else if (c == "amber") {
      return Colors.amber;
    } else if (c == "cyan") {
      return Colors.cyan;
    } else {
      return Colors.white;
    }
  }
}

class WishlistProduct extends StatefulWidget {
  WishlistProduct({Key? key, this.image}) : super(key: key);

  String? image;

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
              child: Image.network(
                widget.image!,
                height: 200,
                width: MediaQuery.of(context).size.width / 2 - 10,
              ),
            ),
            Positioned(top: 20, right: 20, child: Icon(Icons.close))
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
