import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:spicywhips/auth/signup.dart';
import 'package:spicywhips/const/strings.dart';
import 'package:spicywhips/const/textfild.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({Key? key}) : super(key: key);

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          backbutton(),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Change Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Current Password",
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    // height: 160,
                    width: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 237, 237, 237),
                    ),
                    child: TextField(
                      // controller: controller,
                      decoration: InputDecoration(
                          counterText: "",
                          hintText: "",
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
                Text(
                  "New Password",
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    // height: 160,
                    width: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 237, 237, 237),
                    ),
                    child: TextField(
                      // controller: controller,
                      decoration: InputDecoration(
                          counterText: "",
                          hintText: "",
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
                Text(
                  "Confirm Password",
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    // height: 160,
                    width: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 237, 237, 237),
                    ),
                    child: TextField(
                      // controller: controller,
                      decoration: InputDecoration(
                          counterText: "",
                          hintText: "",
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
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  color: themeRed,
                  child: Center(
                      child: Text(
                    "Reset",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
