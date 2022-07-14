import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:spicywhips/auth/signup.dart';
import 'package:spicywhips/const/strings.dart';

class Faqanswer extends StatelessWidget {
  const Faqanswer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backbutton(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: themeRed,
                        size: 10,
                      ),
                      Text(
                        "Back",
                        style: TextStyle(color: themeRed),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "How do I check the status of my order?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    width: 100,
                    height: 3,
                    color: themeRed,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here'",
                    style: TextStyle(color: Color(0xff787878), fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here'",
                    style: TextStyle(color: Color(0xff787878), fontSize: 16),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 217, 217, 217),
                          blurRadius: 2.0,
                          spreadRadius: 1),
                    ], color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Was this information helpful?"),
                        Container(
                          child: Row(
                            children: [
                              Text("Yes"),
                              SizedBox(
                                width: 20,
                              ),
                              Text("No"),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
