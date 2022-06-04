import 'package:flutter/material.dart';
import 'package:spicywhips/auth/login.dart';
import 'package:spicywhips/const/color.dart';
import 'package:spicywhips/const/textfild.dart';

class ContactUS extends StatefulWidget {
  ContactUS({Key? key}) : super(key: key);

  @override
  State<ContactUS> createState() => _ContactUSState();
}

class _ContactUSState extends State<ContactUS> {
  int activeindex = 0;

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
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 35,
                ),
                child: Text(
                  "Contact us",
                  style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 35, top: 10),
                child: Text(
                  "Having queries?\nConnect with us directly.",
                  style: TextStyle(
                      color: Color(0xff403F3F),
                      // letterSpacing: 1,
                      // fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                  child: Textfiless(
                title: "Name",
              )),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Textfiless(
                title: "Email",
              )),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Textfiless(
                title: "Phone Number",
              )),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  // height: 160,
                  width: MediaQuery.of(context).size.width - 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      border: Border.all(color: Color(0xffC4C4C4))
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.withOpacity(0.1),
                      //     spreadRadius: 1,
                      //     blurRadius: 1,
                      //     offset: Offset(1, 3), // changes position of shadow
                      //   ),
                      // ],
                      ),
                  child: TextField(
                    // controller: controller,
                    maxLines: 4,
                    // minLines: 10,
                    decoration: InputDecoration(
                        hintText: "Message",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Color(0xff403F3F),
                          fontWeight: FontWeight.bold,
                        ),
                        // prefixIcon: Icon(icon),
                        border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        if (activeindex == 0) {
                          setState(() {
                            activeindex = 1;
                          });
                        } else {
                          setState(() {
                            activeindex = 0;
                          });
                        }
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        // padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue)),
                        child: activeindex == 0
                            ? Center(
                                child: Icon(
                                Icons.done_outline_outlined,
                                color: Colors.blue,
                              ))
                            : Container(),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/forgetpassword");
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 100,
                        child: Text(
                          "Accept Terms of Services and Privacy Policy",
                          style: TextStyle(
                              color: Colors.black,
                              // letterSpacing: 1,
                              // fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/navigationbar");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 60,
                    height: 63,
                    color: red,
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
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
