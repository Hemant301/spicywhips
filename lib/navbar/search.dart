import 'package:flutter/material.dart';
import 'package:spicywhips/auth/login.dart';
import 'package:spicywhips/bloc/homebloc.dart';
import 'package:spicywhips/modal/homemodal.dart';
import 'package:spicywhips/modal/productmodal.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isShow = true;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    homeBloc.fetchPopularSearch('s');
    homeBloc.fetchNewSearch('s');
    homeBloc.fetchTrendingSearch('s');
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
                    "Search",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        //background color of box
                        BoxShadow(
                          color: Color.fromARGB(255, 223, 223, 223),
                          blurRadius: 5.0, // soften the shadow
                          spreadRadius: 2.0, //extend the shadow
                          offset: Offset(
                            1.0, // Move to right 10  horizontally
                            5.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        controller: searchController,
                        onChanged: (s) {
                          if (s.toString() == "") {
                            setState(() {
                              isShow = true;
                            });
                          } else {
                            setState(() {
                              isShow = false;
                            });
                          }
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Search"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  isShow == false
                      ? Container()
                      : Column(
                          children: [
                            Text(
                              "Popular Search",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            StreamBuilder<PopulatKeyModal>(
                                stream: homeBloc.getpopularSearch.stream,
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return Container();
                                  }
                                  return Wrap(
                                    spacing: 5,
                                    children: List.generate(
                                      snapshot.data!.search.length,
                                      (index) => Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              isShow = false;
                                              searchController.text = snapshot
                                                  .data!.search[index].name!;
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(11),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Text(
                                              snapshot
                                                  .data!.search[index].name!,
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "What\’s new",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            StreamBuilder<NewSearchModal>(
                                stream: homeBloc.getNewSearch.stream,
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return Container();
                                  }
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        children: List.generate(
                                      snapshot.data!.search.length,
                                      (index) => InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/productdiscription',
                                              arguments: {
                                                'id': snapshot
                                                    .data!.search[index].id
                                              });
                                        },
                                        child: SliderBrand(
                                          title: "SPONSORED BRANDS",
                                          image: snapshot
                                              .data!.search[index].image[0].img,
                                        ),
                                      ),
                                    )),
                                  );
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Trending",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            StreamBuilder<NewSearchModal>(
                                stream: homeBloc.getTrendingSearch.stream,
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) return Container();
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        children: List.generate(
                                      snapshot.data!.search.length,
                                      (index) => InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/productdiscription',
                                              arguments: {
                                                'id': snapshot
                                                    .data!.search[index].id
                                              });
                                        },
                                        child: SliderBrand(
                                          title: "SPONSORED BRANDS",
                                          image: snapshot.data!.search[index]
                                              .image[0].img!,
                                        ),
                                      ),
                                    )),
                                  );
                                }),
                          ],
                        ),
                ],
              ),
            )
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //     child: Stack(
      //   children: [
      //     Row(
      //       children: [
      //         Image.asset(
      //           "assets/footerimg1.png",
      //           width: MediaQuery.of(context).size.width,
      //         )
      //       ],
      //     ),
      //     Positioned(
      //       bottom: 0,
      //       right: 0,
      //       child: Image.asset(
      //         "assets/fotterimg2.png",
      //         height: 90,
      //       ),
      //     ),
      //   ],
      // )),
    );
  }
}

class SliderBrand extends StatelessWidget {
  SliderBrand({Key? key, this.title, this.image}) : super(key: key);

  String? title;
  String? image;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                // shape: BoxShape.circle,
                // color: Color(0xffF0F0F0),
                ),
            child: Image.network(
              "${image}",
              fit: BoxFit.contain,
            )),
      ),
    ]);
  }
}
