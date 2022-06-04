import 'package:matcher/matcher.dart';
import 'package:flutter/material.dart';
import 'package:spicywhips/navbar/beg.dart';
import 'package:spicywhips/navbar/category.dart';
import 'package:spicywhips/navbar/home.dart';
import 'package:spicywhips/navbar/profile.dart';
import 'package:spicywhips/navbar/wishlist.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int pageIndex = 0;

  final pages = [
    HomePage(),
    Category(),
    // const Page2(),
    // const Page3(),
    // const Page4(),
  ];

  @override
  Widget build(BuildContext context) {
    switchWithInt() {
      switch (pageIndex) {
        case 1:
          return Category();
        case 2:
          return Profile();
        case 3:
          return Wishlist();
        case 4:
          return MyBeg();
        case 0:

        default:
          return HomePage();
      }
    }

    return Scaffold(
      body: switchWithInt(),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: const BorderRadius.only(
          //   topLeft: Radius.circular(20),
          //   topRight: Radius.circular(20),
          // ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/home.png",
                      height: 25,
                      width: 25,
                      color: pageIndex == 0 ? Colors.red : Colors.black,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: pageIndex == 0 ? Colors.red : Colors.black,
                      ),
                    )
                  ],
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/category.png",
                      height: 25,
                      width: 25,
                      color: pageIndex == 1 ? Colors.red : Colors.black,
                    ),
                    Text(
                      "Category",
                      style: TextStyle(
                        color: pageIndex == 1 ? Colors.red : Colors.black,
                      ),
                    )
                  ],
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/user.png",
                      height: 25,
                      width: 25,
                      color: pageIndex == 2 ? Colors.red : Colors.black,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                        color: pageIndex == 2 ? Colors.red : Colors.black,
                      ),
                    )
                  ],
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/like.png",
                      height: 25,
                      width: 25,
                      color: pageIndex == 3 ? Colors.red : Colors.black,
                    ),
                    Text(
                      "Wishlist",
                      style: TextStyle(
                        color: pageIndex == 3 ? Colors.red : Colors.black,
                      ),
                    )
                  ],
                )),
            InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = 4;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/shopping-bag.png",
                      height: 25,
                      width: 25,
                      color: pageIndex == 4 ? Colors.red : Colors.black,
                    ),
                    Text(
                      "My bag",
                      style: TextStyle(
                        color: pageIndex == 4 ? Colors.red : Colors.black,
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
