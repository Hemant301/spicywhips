import 'package:flutter/material.dart';
import 'package:spicywhips/navbar/home.dart';
import 'package:spicywhips/util/usercred.dart';

class DrawersPage extends StatelessWidget {
  const DrawersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xffE5E5E5),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    // height: MediaQuery.of(context).size.height - 300,
                    width: MediaQuery.of(context).size.width - 10,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(children: [
                      Text(
                        "Welcome Santosh",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "HOME",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "SHOP IN",
                          style:
                              TextStyle(fontSize: 20, color: Color(0xff787878)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // DrawerItem(
                      //   name: "Shop",
                      //   onTap: () {
                      //     Navigator.pushNamed(context, "/shop");
                      //   },
                      // ),
                      DrawerItem(
                        name: "Men",
                        onTap: () {
                          Navigator.pushNamed(context, "/category",
                              arguments: {'title': "Men"});
                        },
                      ),
                      DrawerItem(
                        name: "Women",
                        onTap: () {
                          Navigator.pushNamed(context, "/category",
                              arguments: {'title': "Women"});
                        },
                      ),
                      DrawerItem(
                        name: "Accessories",
                        onTap: () {
                          Navigator.pushNamed(context, "/category",
                              arguments: {'title': "Women"});
                        },
                      ),
                      DrawerItem(
                        name: "Clerance Zone",
                        onTap: () {
                          Navigator.pushNamed(context, "/category",
                              arguments: {'title': "Women"});
                        },
                      ),
                      DrawerItem(
                        name: "Specials",
                        onTap: () {
                          Navigator.pushNamed(context, "/category",
                              arguments: {'title': "Women"});
                        },
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "ENGAGE",
                          style:
                              TextStyle(fontSize: 20, color: Color(0xff787878)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      DrawerItem(
                        name: "Vote for Designs",
                        onTap: () {
                          Navigator.pushNamed(context, "/myorder");
                        },
                      ),
                      DrawerItem(
                        name: "Refer & Earn",
                        onTap: () {
                          Navigator.pushNamed(context, "/myorder");
                        },
                      ),
                      DrawerItem(
                        name: "My Order",
                        onTap: () {
                          Navigator.pushNamed(context, "/myorder");
                        },
                      ),
                      DrawerItem(
                        name: "About Us",
                        onTap: () {
                          Navigator.pushNamed(context, "/aboutus");
                        },
                      ),
                      DrawerItem(
                        name: "Blog",
                        onTap: () {
                          Navigator.pushNamed(context, "/blog");
                        },
                      ),
                      DrawerItem(
                        name: "Contact us",
                        onTap: () {
                          Navigator.pushNamed(context, "/contactus");
                        },
                      ),
                      DrawerItem(
                        name: "Help",
                        onTap: () {
                          Navigator.pushNamed(context, "/help");
                        },
                      ),
                      DrawerItem(
                        name: "Logout",
                        onTap: () {
                          userCred.logoutUser();
                          Navigator.pushNamed(context, "/login");
                        },
                      ),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
