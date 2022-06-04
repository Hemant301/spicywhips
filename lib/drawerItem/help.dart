import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:spicywhips/auth/login.dart';
import 'package:spicywhips/const/color.dart';
import 'package:spicywhips/const/textfild.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backbutton(),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 35,
                ),
                child: Text(
                  "Help",
                  style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 35, top: 10, right: 30),
                child: Text(
                  "Hi, how can we help you?",
                  style: TextStyle(
                      color: Color(0xff403F3F),
                      // letterSpacing: 1,
                      // fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width - 60,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: DropDown(
                    showUnderline: false,
                    items: ["Account Settings", "Account Settings"],
                    hint: Text("Account Settings"),
                    icon: Icon(
                      Icons.expand_more,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width - 60,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: DropDown(
                    showUnderline: false,
                    items: ["Account", "Account "],
                    hint: Text("Login and Password"),
                    icon: Icon(
                      Icons.expand_more,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width - 60,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: DropDown(
                    showUnderline: false,
                    items: ["Account Settings", "Account Settings"],
                    hint: Text("Privacy and Security"),
                    icon: Icon(
                      Icons.expand_more,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              )
            ]),
      ),
      bottomNavigationBar: Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/footerimg1.png",
                    width: MediaQuery.of(context).size.width,
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/fotterimg2.png",
                  height: 90,
                ),
              ),
            ],
          )),
    );
  }
}
