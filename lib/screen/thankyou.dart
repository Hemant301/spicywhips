import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:spicywhips/auth/signup.dart';

class Thankyou extends StatefulWidget {
  const Thankyou({Key? key}) : super(key: key);

  @override
  State<Thankyou> createState() => _ThankyouState();
}

class _ThankyouState extends State<Thankyou> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 40),
            child: InkWell(
                onTap: () => Navigator.pushNamed(context, "/navigationbar"),
                child: Image.asset("assets/backarrow.png")),
          ),
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Image.asset(
                  "assets/thanku.png",
                  height: MediaQuery.of(context).size.height / 3,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "THANK YOU FOR \nSHOPPING",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "We hope this package brightens \n your day as much as your \n order has made ours!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ],
          )
        ],
      ),
    );
  }
}
