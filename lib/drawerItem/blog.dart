import 'package:flutter/material.dart';
import 'package:spicywhips/auth/login.dart';
import 'package:spicywhips/bloc/homebloc.dart';
import 'package:spicywhips/const/color.dart';
import 'package:spicywhips/const/textfild.dart';
import 'package:spicywhips/modal/homemodal.dart';

class Blog extends StatelessWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    homeBloc.fetchBlog();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
          ),
          SingleChildScrollView(
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
                      left: 35,
                    ),
                    child: Text(
                      "Blog",
                      style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  StreamBuilder<BlogModal>(
                      stream: homeBloc.getBlog.stream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return Container();
                        return Column(
                          children: List.generate(
                            snapshot.data!.data.length,
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/blogdetail',
                                      arguments: {
                                        'id': snapshot.data!.data[index].id
                                      });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      snapshot.data!.data[index].blogThumbnail!,
                                      height: 120,
                                      width: 120,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          child: Text(
                                            snapshot.data!.data[index].name!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Color(0xff403F3F),
                                                // letterSpacing: 1,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          child: Text(
                                            snapshot.data!.data[index].detail!,
                                            maxLines: 5,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Color(0xff403F3F),
                                                // letterSpacing: 1,
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 10),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          snapshot.data!.data[index].createdAt!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 151, 148, 148),
                                              // letterSpacing: 1,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    height: 100,
                  )
                ]),
          ),
          Positioned(
            bottom: 0,
            child: Image.asset(
              "assets/mainfooter.png",
              width: MediaQuery.of(context).size.width,
            ),
          )
        ],
      ),
      // bottomNavigationBar: Container(
      //     color: Colors.transparent,
      //     child: Stack(
      //       children: [
      //         Row(
      //           children: [
      //             Image.asset(
      //               "assets/footerimg1.png",
      //               width: MediaQuery.of(context).size.width,
      //             )
      //           ],
      //         ),
      //         Positioned(
      //           bottom: 0,
      //           right: 0,
      //           child: Image.asset(
      //             "assets/fotterimg2.png",
      //             height: 90,
      //           ),
      //         ),
      //       ],
      //     )),
    );
  }
}
