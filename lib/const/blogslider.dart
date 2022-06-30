import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BlogCorosule extends StatefulWidget {
  BlogCorosule({
    Key? key,
  }) : super(key: key);
  // List<SliderimgModal>? data;
  @override
  _BlogCorosuleState createState() => _BlogCorosuleState();
}

class _BlogCorosuleState extends State<BlogCorosule> {
  int ci = 0;

  @override
  Widget build(BuildContext context) {
    List<String> blogs = [
      'https://images.unsplash.com/photo-1656356594492-b4d17dddbbe8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80',
      'https://images.unsplash.com/photo-1644982654072-0b42e6636821?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1644982653424-1bfed7f972a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1089&q=80'
    ];
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Navigator.pushNamed(context, "/bundlecreatorPage",
            //     arguments: {'id': '1', 'index': '1'});
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CarouselSlider(
                  options: CarouselOptions(
                    onPageChanged: (int i, G) {
                      setState(() {
                        ci = i;
                      });
                    },
                    //onPageChanged: (int index) {},
                    //height: size.width / 2,
                    aspectRatio: 17 / 16.8,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    //onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: List.generate(
                    blogs.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                              width: 378,
                              height: 210,
                              child: Image.network(
                                blogs[index],
                                fit: BoxFit.cover,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 50,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '5 june',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff8C8B8B),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'It is a long established fact that a reader.',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration:
                                        BoxDecoration(color: Colors.red),
                                    child: Text(
                                      'Read More',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              blogs.length,
              (index) => Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ci == index ? Colors.red : Colors.grey),
                    ),
                  )),
        ),
      ],
    );
  }
}
