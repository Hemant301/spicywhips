import 'package:flutter/material.dart';
import 'package:spicywhips/auth/forgetpassword.dart';
import 'package:spicywhips/auth/login.dart';
import 'package:spicywhips/auth/newpassword.dart';
import 'package:spicywhips/auth/otptoreset.dart';
import 'package:spicywhips/auth/signup.dart';
import 'package:spicywhips/auth/sucesspassword.dart';
import 'package:spicywhips/auth/verificationotp.dart';
import 'package:spicywhips/const/commercial.dart';
import 'package:spicywhips/drawerItem/aboutus.dart';
import 'package:spicywhips/drawerItem/accessories.dart';
import 'package:spicywhips/drawerItem/blog.dart';
import 'package:spicywhips/drawerItem/contactus.dart';
import 'package:spicywhips/drawerItem/help.dart';
import 'package:spicywhips/drawerItem/myorder.dart';
import 'package:spicywhips/drawerItem/myorderdetail.dart';
import 'package:spicywhips/drawerItem/productdiscription.dart';
import 'package:spicywhips/drawerItem/shop.dart';
import 'package:spicywhips/drawerItem/special.dart';
import 'package:spicywhips/drawerItem/womencat.dart';
import 'package:spicywhips/navbar/beg.dart';
import 'package:spicywhips/navbar/category.dart';
import 'package:spicywhips/navbar/navigationbar.dart';
import 'package:spicywhips/navbar/search.dart';
import 'package:spicywhips/screen/blogdetail.dart';
import 'package:spicywhips/screen/checkout.dart';
import 'package:spicywhips/screen/editaddress.dart';
import 'package:spicywhips/screen/faqanswer.dart';
import 'package:spicywhips/screen/notification.dart';
import 'package:spicywhips/screen/ratedelivery.dart';
import 'package:spicywhips/screen/rateproduct.dart';
import 'package:spicywhips/screen/refer.dart';
import 'package:spicywhips/screen/referhelp.dart';
import 'package:spicywhips/screen/selectaddress.dart';
import 'package:spicywhips/screen/vote.dart';
import 'package:spicywhips/splash/splashscreen.dart';
import 'package:spicywhips/util/storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SpicyWhips',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        // navigatorKey: navigatorKey,
        theme: ThemeData(
          fontFamily: "sen",
        ),
        initialRoute: '/splashscreen',
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
          "/selectaddress": (context) => Selectaddress(),
          "/signup": (context) => Signup(),
          "/myorder": (context) => Myorder(),
          "/myorderdetail": (context) => Myorderdetail(),
          "/sucesspassword": (context) => Successpassword(),
          "/category": (context) => Category(),
          "/otptoreset": (context) => Otptoreset(),
          "/search": (context) => Search(),
          "/notification": (context) => NotificationScreen(),
          "/special": (context) => Special(),
          "/accessories": (context) => Accessories(),
          "/refer": (context) => Refer(),
          "/referhelp": (context) => Referhelp(),
          "/faqanswer": (context) => Faqanswer(),
          "/vote": (context) => Vote(),
          "/ratedelivery": (context) => Ratedelivery(),
          "/rateproduct": (context) => Rateproduct(),
          "/beg": (context) => MyBeg(),
          "/editaddress": (context) => EditAddress(),
        });
  }
}
