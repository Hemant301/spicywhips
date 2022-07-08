import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:spicywhips/bloc/homebloc.dart';
import 'package:spicywhips/modal/homemodal.dart';

class TestimonialSlider extends StatefulWidget {
  TestimonialSlider({
    Key? key,
  }) : super(key: key);
  // List<SliderimgModal>? data;
  @override
  _TestimonialSliderState createState() => _TestimonialSliderState();
}

class _TestimonialSliderState extends State<TestimonialSlider> {
  int ci = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TestimonialModal>(
        stream: homeBloc.getHomeTestimonial.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();
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
                          aspectRatio: 25 / 16.8,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 10),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: false,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          //onPageChanged: callbackFunction,
                          scrollDirection: Axis.horizontal,
                        ),
                        items: List.generate(
                          snapshot.data!.data.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Color(0xffF3F3F3),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 25,
                                        backgroundColor:
                                            Colors.grey.withOpacity(0.2),
                                        // backgroundImage: NetworkImage(''),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data!.data[index].name!,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            snapshot
                                                .data!.data[index].createdAt!,
                                            style: TextStyle(),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 50,
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(snapshot
                                            .data!.data[index].description!)),
                                  )
                                ],
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
                    snapshot.data!.data.length,
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
        });
  }
}
