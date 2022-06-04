import "package:flutter/material.dart";
import 'package:spicywhips/auth/login.dart';

class MyBeg extends StatelessWidget {
  const MyBeg({Key? key}) : super(key: key);

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
                left: 16,
              ),
              child: Text(
                "SHOPPING CART",
                style: TextStyle(
                    color: Colors.black,
                    // letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Center(
            //   child: Container(
            //     padding: EdgeInsets.all(16),
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         border: Border.all(color: Colors.grey)),
            //     // color: Color.fromARGB(255, 17, 18, 18),

            //     width: MediaQuery.of(context).size.width - 20,
            //     child:
            //   )
            //   ),
            // ),
          ]),
    );
  }
}
