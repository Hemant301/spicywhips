import 'package:flutter/material.dart';
import 'package:spicywhips/util/usercred.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (userCred.isUserLogin()) {
        Navigator.pushReplacementNamed(context, "/navigationbar");
      } else {
        Navigator.pushReplacementNamed(context, "/login");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [
              Colors.orange,
              Colors.purple,
            ]

                //     colors: [
                //   Color(0xffCF0018),
                //   Color.fromARGB(255, 202, 183, 185)
                // ]

                )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Image.asset(
                  "assets/SWgradient20x.png",
                  height: 150,
                  width: 150,
                  fit: BoxFit.contain,
                ))
              ]),
        ));
  }
}
