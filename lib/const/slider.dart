import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyCorosule extends StatefulWidget {
  MyCorosule({
    Key? key,
  }) : super(key: key);
  // List<SliderimgModal>? data;
  @override
  _MyCorosuleState createState() => _MyCorosuleState();
}

class _MyCorosuleState extends State<MyCorosule> {
  int ci = 0;

  @override
  Widget build(BuildContext context) {
    List<String> image = [
      "assets/016 Slider.jpeg",
      "assets/slider2.jpeg",
      "assets/slider3.jpeg"
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
                    aspectRatio: 3.8 / 2,
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
                    image.length,
                    (index) => InkWell(
                      // onTap: () {
                      //   Navigator.pushNamed(context, '/categorylist',
                      //       arguments: {'id': (widget.data![index].cat).toString()});
                      // },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          image[index],
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset('assets/b1.png'),
                          fit: BoxFit.fill,
                        ),
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
              image.length,
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
