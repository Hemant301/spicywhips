import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:spicywhips/bloc/homebloc.dart';
import 'package:spicywhips/modal/homemodal.dart';
import 'package:spicywhips/shimmer/shimmer.dart';

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
    return StreamBuilder<SliderModal>(
        stream: homeBloc.getslider.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Shimmer_homeSlider();
          }
          return Column(
            children: [
              InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, "/bundlecreatorPage",
                  //     arguments: {'id': '1', 'index': '1'});
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
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
                        snapshot.data!.data.length,
                        (index) => InkWell(
                          // onTap: () {
                          //   Navigator.pushNamed(context, '/categorylist',
                          //       arguments: {'id': (widget.data![index].cat).toString()});
                          // },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              snapshot.data!.data[index].sliderImage!,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset('assets/016 Slider.jpeg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    snapshot.data!.data.length,
                    (index) => Container(
                          width: MediaQuery.of(context).size.width /
                              snapshot.data!.data.length,
                          height: 5,
                          decoration: BoxDecoration(
                              color: ci == index ? Colors.red : Colors.grey),
                        )),
              ),
            ],
          );
        });
  }
}
