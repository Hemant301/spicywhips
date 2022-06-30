import 'package:flutter/material.dart';
import 'package:spicywhips/auth/forgetpassword.dart';
import 'package:spicywhips/auth/login.dart';
import 'package:spicywhips/auth/newpassword.dart';
import 'package:spicywhips/auth/verificationotp.dart';
import 'package:spicywhips/const/commercial.dart';
import 'package:spicywhips/drawerItem/aboutus.dart';
import 'package:spicywhips/drawerItem/blog.dart';
import 'package:spicywhips/drawerItem/contactus.dart';
import 'package:spicywhips/drawerItem/help.dart';
import 'package:spicywhips/drawerItem/productdiscription.dart';
import 'package:spicywhips/drawerItem/shop.dart';
import 'package:spicywhips/drawerItem/womencat.dart';
import 'package:spicywhips/navbar/navigationbar.dart';
import 'package:spicywhips/screen/blogdetail.dart';
import 'package:spicywhips/screen/checkout.dart';
import 'package:spicywhips/splash/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Spicyehips',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        // navigatorKey: navigatorKey,
        theme: ThemeData(
          fontFamily: "sen",
        ),
        initialRoute: ('/splashscreen'),
        routes: {
          "/splashscreen": (context) => SplashScreen(),
          "/login": (context) => Login(),
          "/forgetpassword": (context) => ForgetPassword(),
          "/verificationotp": (context) => Verificationotp(),
          "/newpassword": (context) => NewPassword(),
          "/aboutus": (context) => AboutUs(),
          "/contactus": (context) => ContactUS(),
          "/blog": (context) => Blog(),
          "/help": (context) => Help(),

          "/womencat": (context) => WomneCat(),
          "/shop": (context) => ShopPage(),
          "/productdiscription": (context) => ProductDiscription(),
          // "/womencat": (context) => WomneCat(),
          // "/womencat": (context) => WomneCat(),
          // "/womencat": (context) => WomneCat(),

          // navigationbar
          "/navigationbar": (context) => NavBar(),
          "/commercial": (context) => Commercial(),
          "/checkout": (context) => Checkout(),
          "/blogdetail": (context) => Blogdetails(),
        });
  }
}
