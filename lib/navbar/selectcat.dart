import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:spicywhips/auth/login.dart';

class SelectCat extends StatelessWidget {
  const SelectCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Image.asset("assets/backarrow.png")),
        title: Text(
          'CATEGORY',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
        ),
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
            width: 20,
          ),
          Icon(
            Icons.notifications_outlined,
            color: Colors.black,
            size: 30,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/category',
                          arguments: {'title': "Men"});
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 24,
                      color: Color(0xffF3F3F3),
                      height: 76,
                      child: Center(
                        child: Text(
                          "Men",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/category',
                          arguments: {'title': "Women"});
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 24,
                      color: Color(0xffF3F3F3),
                      height: 76,
                      child: Center(
                        child: Text(
                          "Women",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Sub Category",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(
                    8,
                    (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/category',
                                  arguments: {'title': "Classic Car 1"});
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2 - 24,
                              color: Color(0xffF3F3F3),
                              height: 76,
                              child: Center(
                                child: Text(
                                  "Classic Car 1",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
