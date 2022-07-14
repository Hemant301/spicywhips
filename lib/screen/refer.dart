import 'package:flutter/material.dart';
import 'package:spicywhips/auth/login.dart';

class Refer extends StatelessWidget {
  const Refer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          backbutton(),
          SizedBox(
            height: 20,
          ),
          Center(child: Image.asset('assets/refer.png')),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Imvite your friends to Spicywhips and",
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Text(
              "earn ₹100 for every refferal",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              "Tap to copy the code",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration:
                  BoxDecoration(border: Border.all(color: Color(0xffC4C4C4))),
              child: Center(
                child: Text(
                  "KAEEIGH",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "How does refferal work?",
                  style: TextStyle(
                      color: Color(0xff8C8B8B),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("1. Invite your friend to spicywhips"),
                SizedBox(
                  height: 5,
                ),
                Text(
                    "2. They place their first order with your refferal code & get a flat ₹100 discount "),
                SizedBox(
                  height: 5,
                ),
                Text(
                    "3. Their orders gets completed (delivered & crossed the    return window) "),
                SizedBox(
                  height: 5,
                ),
                Text("4. You get spicywhips credits worth ₹100"),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/referhelp');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Need more help?",
                      style: TextStyle(color: Color(0xff910311)),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
