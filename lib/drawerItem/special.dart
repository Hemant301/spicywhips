import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:spicywhips/auth/login.dart';

class Special extends StatefulWidget {
  const Special({Key? key}) : super(key: key);

  @override
  State<Special> createState() => _SpecialState();
}

class _SpecialState extends State<Special> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Specials",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Image.asset("assets/backarrow.png")),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/search');
            },
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/notification');
            },
            child: Image.asset(
              "assets/bell (4) 2.png",
              height: 30,
              width: 30,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      activeIndex = 0;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Men",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: activeIndex == 0 ? Colors.red : Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      activeIndex = 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Women",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: activeIndex == 1 ? Colors.red : Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      activeIndex = 2;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Accessories",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: activeIndex == 2 ? Colors.red : Colors.black),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(
                  10,
                  (index) => InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/category",
                              arguments: {"title": "Printed  T- Shirts"});
                        },
                        child: Container(
                          child: Column(children: [
                            Container(
                                width: 150,
                                height: 150,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  child: Image.asset(
                                    "assets/Rectangle 30.png",
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            Container(
                              width: 150,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 225, 225, 225),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                  child: Text(
                                "Printed  T- Shirts",
                                maxLines: 1,
                              )),
                            )
                          ]),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
