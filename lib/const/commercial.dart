import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spicywhips/auth/login.dart';

class Commercial extends StatefulWidget {
  const Commercial({Key? key}) : super(key: key);

  @override
  State<Commercial> createState() => _CommercialState();
}

bool swipe = true;

class _CommercialState extends State<Commercial> {
  String searchkey = 'all';
  int searchIndex = 0;
  bool is_like = false;
  bool if_liked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.vertical,
            onPageChanged: (s) {
              setState(() {
                swipe = false;
              });
            },
            children: List.generate(
              4,
              (i) => FeedSlider(
                if_liked: if_liked,
                num: 4,
                indeX: i,
                is_swipe: swipe,
                title: "Divyanshi",
                is_like: is_like,
                onFavTap: () {
                  print('object');
                  if (if_liked == true) {
                    setState(() {
                      if_liked = false;
                    });
                  } else {
                    setState(() {
                      if_liked = true;
                    });
                  }
                },
                onDoubleTap: () {
                  setState(() {
                    is_like = true;
                    if_liked = true;
                  });
                  Future.delayed(Duration(seconds: 1), () {
                    setState(() {
                      is_like = false;
                    });
                  });
                },
                onTap: () {
                  return;
                  Navigator.pushNamed(context, '/storydetails', arguments: {
                    // 'title': snapshot
                    //     .data!.stories[i].title,
                    // 'image': snapshot
                    //     .data!
                    //     .stories[i]
                    //     .image[index]
                    //     .image,
                    // 'desc': snapshot
                    //     .data!.stories[i].story,
                  });
                  // Fluttertoast.showToast(msg: 'Wait');
                },
                desc:
                    "It is a long established fact that a reader will be distracted by the readable content.",
                image:
                    "https://images.unsplash.com/photo-1656428405656-26413b652b56?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
              ),
            ),
          ),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height,
          //   child: Image.asset(
          //     'assets/transreels.png',
          //     fit: BoxFit.cover,
          //   ),
          // ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 150,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromARGB(0, 0, 0, 0),
                  Color.fromARGB(51, 0, 0, 0),
                  Color.fromARGB(108, 0, 0, 0),
                  Color.fromARGB(117, 0, 0, 0),
                  Color.fromARGB(127, 0, 0, 0),
                  Color.fromARGB(149, 0, 0, 0),
                ],
              )),
            ),
          ),
          Positioned(
            top: 30,
            left: 30,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/whitearrow.png')),
                  Text(
                    'Commercial',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeedSlider extends StatefulWidget {
  FeedSlider(
      {Key? key,
      this.desc,
      this.image,
      this.onTap,
      this.title,
      this.indeX,
      this.if_liked = false,
      this.num,
      this.is_like = false,
      this.onFavTap,
      this.onDoubleTap,
      this.is_swipe = true})
      : super(key: key);
  String? image;
  String? title;
  String? desc;
  Function()? onTap;
  Function()? onDoubleTap;
  Function()? onFavTap;
  bool? is_swipe;
  int? indeX;
  int? num;
  bool is_like = false;
  bool if_liked = false;

  @override
  State<FeedSlider> createState() => _FeedSliderState();
}

class _FeedSliderState extends State<FeedSlider> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onDoubleTap: widget.onDoubleTap,
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                '${widget.image}',
                fit: BoxFit.cover,
              )),
        ),
        // Positioned(
        //   bottom: 200,
        //   left: 0,
        //   right: 0,
        //   child: Container(
        //     color: Color.fromARGB(0, 167, 125, 125),
        //     child: Padding(
        //       padding: const EdgeInsets.all(5.0),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: List.generate(
        //             widget.num!,
        //             (index) => Padding(
        //                   padding: const EdgeInsets.all(5.0),
        //                   child: Container(
        //                     height: index == (widget.indeX) ? 6 : 5,
        //                     width: index == widget.indeX ? 6 : 5,
        //                     decoration: BoxDecoration(
        //                         shape: BoxShape.circle,
        //                         color: index == widget.indeX
        //                             ? Colors.white
        //                             : Color.fromARGB(255, 184, 184, 184)),
        //                   ),
        //                 )),
        //       ),
        //     ),
        //   ),
        // ),
        // Positioned(
        //   top: 30,
        //   // left: 10,
        //   child:
        // ),
        widget.is_like == true
            ? Center(child: Lottie.asset('assets/like.json', height: 150))
            : Container(),
        widget.is_swipe == true
            ? Center(child: Lottie.asset('assets/swipe.json', height: 250))
            : Container(),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color.fromARGB(233, 0, 0, 0),
                Color.fromARGB(172, 0, 0, 0),
                Color.fromARGB(160, 0, 0, 0),
                Color.fromARGB(108, 0, 0, 0),
                Color.fromARGB(51, 0, 0, 0),
                Color.fromARGB(6, 0, 0, 0),
              ],
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.title}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    InkWell(
                      onTap: widget.onFavTap,
                      child: Container(
                          child: widget.if_liked == false
                              ? Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.white,
                                  size: 30,
                                )
                              : Icon(
                                  Icons.favorite,
                                  color: Color.fromARGB(255, 253, 0, 0),
                                  size: 30,
                                )),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${widget.desc}',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
                  height: 5,
                ),
                // InkWell(
                //   onTap: widget.onTap,
                //   child: Container(
                //       padding: EdgeInsets.all(5),
                //       decoration: BoxDecoration(
                //           boxShadow: [
                //             //background color of box
                //             BoxShadow(
                //               color: Color.fromARGB(255, 152, 152, 152),
                //               blurRadius: 2.0, // soften the shadow
                //               spreadRadius: 1.0, //extend the shadow
                //               offset: Offset(
                //                 0.0, // Move to right 10  horizontally
                //                 0.0, // Move to bottom 10 Vertically
                //               ),
                //             )
                //           ],
                //           color: Colors.pink,
                //           borderRadius: BorderRadius.circular(10)),
                //       child: Text(
                //         'Read More',
                //         style: TextStyle(color: Colors.white, fontSize: 12),
                //       )),
                // )
              ],
            ),
          ),
        )
      ],
    );
  }
}
