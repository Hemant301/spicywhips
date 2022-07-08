import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spicywhips/api/authapi.dart';
import 'package:spicywhips/auth/forgetpassword.dart';
import 'package:spicywhips/auth/login.dart';
import 'package:spicywhips/const/color.dart';
import 'package:spicywhips/const/strings.dart';
import 'package:spicywhips/const/textfild.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  bool isLoading = false;
  TextEditingController pwdController = TextEditingController();
  TextEditingController cpwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    print(rcvdData['id']);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backbutton(),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 35,
                ),
                child: Text(
                  "New Password",
                  style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 35, top: 10, right: 30),
                child: Text(
                  "Your new password must be\ndifferent from previous one.",
                  style: TextStyle(
                      color: Color(0xff403F3F),
                      // letterSpacing: 1,
                      // fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                  child: Textfiless(
                title: "New password",
                controller: pwdController,
              )),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Textfiless(
                title: "Confirm password",
                controller: cpwdController,
              )),
              SizedBox(
                height: 40,
                child: isLoading == true
                    ? Center(
                        child: CircularProgressIndicator(
                        color: themeRed,
                      ))
                    : Container(),
              ),
              // Center(
              //     child: Textfiless(
              //   title: "Password",
              // )),

              SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  onTap: () async {
                    if (pwdController.text.length < 6) {
                      Fluttertoast.showToast(
                          msg: 'Password Should be minimun 6 digit');
                      return;
                    } else if (pwdController.text != cpwdController.text) {
                      Fluttertoast.showToast(msg: 'Password not match');
                      return;
                    }
                    setState(() {
                      isLoading = true;
                    });
                    AuthApi _api = AuthApi();
                    Map data = await _api.resetPassword(
                        "${rcvdData['id']}", pwdController.text);

                    if (data['status'].toString() == "200") {
                      Navigator.pushNamed(context, "/sucesspassword");
                      setState(() {
                        isLoading = false;
                      });
                    } else {
                      Fluttertoast.showToast(msg: data['message']);
                      setState(() {
                        isLoading = false;
                      });
                      return;
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 60,
                    height: 50,
                    color: red,
                    child: Center(
                      child: Text(
                        "Reset Password",
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 100,
              )
            ]),
      ),
      bottomNavigationBar: Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/footerimg1.png",
                    width: MediaQuery.of(context).size.width,
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/fotterimg2.png",
                  height: 90,
                ),
              ),
            ],
          )),
    );
  }
}
