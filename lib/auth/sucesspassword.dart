import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:spicywhips/const/strings.dart';

class Successpassword extends StatelessWidget {
  const Successpassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Image.asset('assets/success.png'),
            Text(
              "CONGRATULATIONS",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: themeRed),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Your password has been changed\n successfully,  login to continue",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/login");
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 60,
                  height: 50,
                  color: themeRed,
                  child: Center(
                    child: Text(
                      "Login",
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
        )),
      ),
    );
  }
}
