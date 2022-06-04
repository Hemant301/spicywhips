import 'package:flutter/material.dart';
import 'package:spicywhips/auth/login.dart';
import 'package:spicywhips/const/color.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          backbutton(),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8,
            ),
            child: Text(
              "EDIT PROFILE",
              style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffF0F0F0),
                ),
                child: Image.asset(
                  "assets/Ellipse 138 (1).png",
                  fit: BoxFit.contain,
                )),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xffF5F5F5),
              ),
              padding: EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width - 60,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "Hemant Kumar",
                      style: TextStyle(
                          color: Color(0xff787878),
                          letterSpacing: 1,
                          // fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xffF5F5F5),
              ),
              padding: EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width - 60,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Phone",
                      style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "8210925188",
                      style: TextStyle(
                          color: Color(0xff787878),
                          letterSpacing: 1,
                          // fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xffF5F5F5),
              ),
              padding: EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width - 60,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "gupta@gmail.com",
                      style: TextStyle(
                          color: Color(0xff787878),
                          letterSpacing: 1,
                          // fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ]),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/");
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 60,
                height: 63,
                color: red,
                child: Center(
                  child: Text(
                    "Save",
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
        ],
      ),
    );
  }
}
