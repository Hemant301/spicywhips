import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "/login");
    });
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
                  "assets/SWgradient20x_100x@2x 1.png",
                  height: 150,
                  width: 150,
                  fit: BoxFit.contain,
                ))
              ]),
        ));
  }
}
