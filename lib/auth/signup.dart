import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spicywhips/api/authapi.dart';
import 'package:spicywhips/const/color.dart';
import 'package:spicywhips/const/strings.dart';
import 'package:spicywhips/const/textfild.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController cpwdController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeRed,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          // backbutton(),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset('assets/whitearrow.png'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 35,
            ),
            child: Text(
              "CREATE NEW ACCOUNT",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Textfiless(
                    title: "Name",
                    controller: nameController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Textfiless(
                    title: "Phone no.",
                    controller: phoneController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Textfiless(
                    title: "Email",
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Textfiless(
                    title: "Password",
                    controller: pwdController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Textfiless(
                    title: "Confirm Password",
                    controller: cpwdController,
                  ),
                  SizedBox(
                    height: 30,
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
                        if (nameController.text == "" ||
                            phoneController.text == "" ||
                            emailController.text == "" ||
                            pwdController.text == "" ||
                            cpwdController.text == "") {
                          Fluttertoast.showToast(msg: "Enter all fields");
                          return;
                        } else if (pwdController.text != cpwdController.text) {
                          Fluttertoast.showToast(msg: "Password not matched");
                          return;
                        }
                        setState(() {
                          isLoading = true;
                        });
                        AuthApi _api = AuthApi();
                        Map data = await _api.doSignin(
                            email: emailController.text,
                            name: nameController.text,
                            phone: phoneController.text,
                            pwd: pwdController.text);

                        if (data['status'].toString() == "200") {
                          Navigator.pushNamed(context, "/verificationotp",
                              arguments: {'id': data['result']['_id']});
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
                            "Create account",
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
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(38.0),
                      child: Row(
                        children: [
                          Text("Already have an account?"),
                          SizedBox(width: 10),
                          Text(
                            "Sign In",
                            style: TextStyle(color: themeRed),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
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
