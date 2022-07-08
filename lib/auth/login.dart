import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spicywhips/api/authapi.dart';
import 'package:spicywhips/const/color.dart';
import 'package:spicywhips/const/strings.dart';
import 'package:spicywhips/const/textfild.dart';
import 'package:spicywhips/util/usercred.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // backbutton(),
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 35,
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 35, top: 10),
                child: Text(
                  "Welcome \nto spicywhips",
                  style: TextStyle(
                      color: Color(0xff403F3F),
                      // letterSpacing: 1,
                      // fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                  child: Textfiless(
                title: "Enter mobile number or Email",
                controller: emailController,
              )),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Textfiless(
                title: "Password",
                controller: pwdController,
              )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/forgetpassword");
                      },
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                            color: red,
                            // letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              isLoading == true
                  ? Center(
                      child: CircularProgressIndicator(
                      color: themeRed,
                    ))
                  : Container(),
              Center(
                child: InkWell(
                  onTap: () async {
                    if (emailController.text == "" ||
                        pwdController.text == "") {
                      Fluttertoast.showToast(msg: "Enter all fields");
                      return;
                    } else if (pwdController.text.length < 6) {
                      Fluttertoast.showToast(
                          msg: "Password should be of 6 digits");
                      return;
                    }
                    setState(() {
                      isLoading = true;
                    });
                    AuthApi _api = AuthApi();
                    Map data = await _api.doLogin(
                        emailController.text, pwdController.text);
                    print(data);
                    if (data['status'].toString() == "200") {
                      userCred.addUserId(data["user"]["_id"]);
                      userCred.addUserToken(data["token"]);

                      Navigator.pushNamed(context, "/navigationbar");
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
                        "Login",
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
                height: 50,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dont have account?",
                        style: TextStyle(
                            color: Colors.black,
                            // letterSpacing: 1,
                            // fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Text(
                        "New account",
                        style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
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

class backbutton extends StatelessWidget {
  backbutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 40),
      child: InkWell(
          onTap: () => Navigator.pop(context),
          child: Image.asset("assets/backarrow.png")),
    );
  }
}
