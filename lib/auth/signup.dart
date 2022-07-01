import 'package:flutter/material.dart';
import 'package:spicywhips/const/color.dart';
import 'package:spicywhips/const/strings.dart';
import 'package:spicywhips/const/textfild.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeRed,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          // backbutton(),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset('assets/whitearrow.png'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 35,
            ),
            child: Text(
              "CREATE NEW ACCOUNT",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Textfiless(
                    title: "Name",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Textfiless(
                    title: "Phone no.",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Textfiless(
                    title: "Email",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Textfiless(
                    title: "Password",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Textfiless(
                    title: "Confirm Password",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/navigationbar");
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 60,
                        height: 50,
                        color: red,
                        child: Center(
                          child: Text(
                            "Create account",
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
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(38.0),
                      child: Row(
                        children: [
                          Text("Already have an account?"),
                          SizedBox(width: 10),
                          Text(
                            "Sign In",
                            style: TextStyle(color: themeRed),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class backbutton extends StatelessWidget {
  backbutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 40),
      child: InkWell(
          onTap: () => Navigator.pop(context),
          child: Image.asset("assets/backarrow.png")),
    );
  }
}
