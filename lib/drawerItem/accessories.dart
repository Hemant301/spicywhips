import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:spicywhips/auth/login.dart';

class Accessories extends StatefulWidget {
  const Accessories({Key? key}) : super(key: key);

  @override
  State<Accessories> createState() => _AccessoriesState();
}

class _AccessoriesState extends State<Accessories> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Accessories",
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
