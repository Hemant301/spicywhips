import 'package:flutter/material.dart';
import 'package:spicywhips/auth/login.dart';
import 'package:spicywhips/const/color.dart';
import 'package:spicywhips/const/textfild.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

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
                  "Forgot\nPassword",
                  style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 35, top: 10),
                child: Text(
                  "Enter phone number\nto recover password",
                  style: TextStyle(
                      color: Color(0xff403F3F),
                      // letterSpacing: 1,
                      // fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                  child: Textfiless(
                title: "Enter mobile number or Email",
              )),
              SizedBox(
                height: 20,
              ),
              // Center(
              //     child: Textfiless(
              //   title: "Password",
              // )),

              SizedBox(
                height: 40,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/verificationotp");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 60,
                    height: 50,
                    color: red,
                    child: Center(
                      child: Text(
                        "Send otp",
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

              // SizedBox(
              //   height: 100,
              // )
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
