// Category
import "package:flutter/material.dart";
import 'package:lottie/lottie.dart';
import 'package:spicywhips/bloc/homebloc.dart';
import 'package:spicywhips/const/color.dart';
import 'package:spicywhips/modal/categorymodal.dart';
import 'package:spicywhips/modal/homemodal.dart';
import 'package:spicywhips/modal/productmodal.dart';
import 'package:spicywhips/shimmer/shimmer.dart';

class Category extends StatefulWidget {
  Category({
    Key? key,
  }) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool isOpen = false;

  var bottomSheetController;
  int activeman = 0;
  // final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    id = rcvdData['id'];
  }

  String id = "";
  @override
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    print(rcvdData['title']);

    homeBloc.fetchCSupersubCat(id);
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
          "${rcvdData['title']}",
          style: TextStyle(
            color: Colors.black,
          ),
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
            StreamBuilder<SubCatModal>(
                stream: homeBloc.getSubcat.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        snapshot.data!.data.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                id = snapshot.data!.data[index].id!;
                              });
                              homeBloc.removeState2();
                            },
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
                                    child: Image.network(
                                      snapshot
                                          .data!.data[index].subcategoryImage!,
                                      fit: BoxFit.contain,
                                    )),
                                Center(
                                    child: Container(
                                        width: 80,
                                        child: Text(
                                          snapshot.data!.data[index].name!,
                                          maxLines: 2,
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        )))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
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
            StreamBuilder<SuperSubcatModal>(
                stream: homeBloc.getSuperSubcat.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Shimmer_wishList();
                  return Column(
                    children: [
                      snapshot.data!.product.isEmpty
                          ? Column(
                              children: [
                                Opacity(
                                  opacity: 0.5,
                                  child: Lottie.asset('assets/empty.json',
                                      height: 200, repeat: false),
                                ),
                                Text("No Data Found")
                              ],
                            )
                          : GridView(
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
                                snapshot.data!.product.length,
                                (index) => InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, "/productdiscription",
                                        arguments: {
                                          'id': snapshot.data!.product[index].id
                                        });
                                  },
                                  child: ProductList(
                                    data: snapshot.data!.product[index],
                                  ),
                                ),
                              )),
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}

class ProductList extends StatefulWidget {
  ProductList({Key? key, this.iswishlis, this.data}) : super(key: key);

  // int? wishindex = 0;
  bool? iswishlis;
  bool islike = false;
  SubproductCatModal? data;
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
              child: Image.network(
                widget.data!.profile[0].img!,
                height: 200,
                width: MediaQuery.of(context).size.width / 2 - 10,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2 - 10,
                child: Text(
                  widget.data!.name!,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2 - 10,
                child: Text(
                  widget.data!.desc!,
                  style: TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 11),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2 - 10,
                child: Text(
                  widget.data!.attr[0].price!,
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
                  widget.data!.attr.length,
                  (c) => Container(
                    color: changeColor(widget.data!.attr[c].colorname),
                    height: 15,
                    width: 15,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
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
