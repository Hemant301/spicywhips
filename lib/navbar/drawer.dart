import 'package:flutter/material.dart';
import 'package:spicywhips/navbar/home.dart';

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
                      DrawerItem(
                        name: "Shop",
                        onTap: () {
                          Navigator.pushNamed(context, "/shop");
                        },
                      ),
                      DrawerItem(name: "Men"),
                      DrawerItem(
                        name: "Women",
                        onTap: () {
                          Navigator.pushNamed(context, "/womencat");
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
