import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spicywhips/api/authapi.dart';
import 'package:spicywhips/auth/forgetpassword.dart';
import 'package:spicywhips/auth/login.dart';
import 'package:spicywhips/const/color.dart';
import 'package:spicywhips/const/strings.dart';
import 'package:spicywhips/const/textfild.dart';
import 'package:pinput/pinput.dart';
import 'package:spicywhips/util/usercred.dart';

class VerifyMobilenumber extends StatefulWidget {
  const VerifyMobilenumber({Key? key}) : super(key: key);

  @override
  State<VerifyMobilenumber> createState() => _VerifyMobilenumberState();
}

class _VerifyMobilenumberState extends State<VerifyMobilenumber> {
  bool isLoading = false;

  TextEditingController otpController = TextEditingController();

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
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                ),
                child: Text(
                  "Verification",
                  style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),

              const SizedBox(
                height: 60,
              ),
              Center(
                  child: Pinput(
                controller: otpController,
                length: 6,
                // defaultPinTheme: defaultPinTheme,
                // focusedPinTheme: focusedPinTheme,
                // submittedPinTheme: submittedPinTheme,
                validator: (s) {
                  // return s == '2222' ? null : 'Pin is incorrect';
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) => print(pin),
              )),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: const Text(
                  "Enter the verification code we just send you on your registered phone number or email id",
                  style: const TextStyle(
                      color: Color(0xff403F3F),
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              // Center(
              //     child: Textfiless(
              //   title: "Password",
              // )),
              isLoading == true
                  ? Center(
                      child: CircularProgressIndicator(
                      color: themeRed,
                    ))
                  : Container(),

              const SizedBox(
                height: 40,
              ),
              Center(
                child: InkWell(
                  onTap: () async {
                    if (otpController.text == "") {
                      Fluttertoast.showToast(msg: "Enter OTP");
                      return;
                    }
                    setState(() {
                      isLoading = true;
                    });
                    AuthApi _api = AuthApi();
                    Map data = await _api.verifyotp(
                        "${rcvdData['id']}", otpController.text);

                    if (data['status'].toString() == "200") {
                      userCred.addUserId(data["user"]["_id"]);
                      Navigator.pushNamed(
                        context,
                        "/navigationbar",
                      );
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

                    // Navigator.pushNamed(context, "/newpassword");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 60,
                    height: 50,
                    color: red,
                    child: const Center(
                      child: const Text(
                        "Verify",
                        style: const TextStyle(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  // height: 160,
                  width: MediaQuery.of(context).size.width - 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      border:
                          Border.all(color: const Color(0xffC4C4C4), width: 2)),
                  child: Center(
                    child: const Text(
                      "Wait for 30 sec",
                      style: const TextStyle(
                          color: Color(0xff403F3F),
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
              ),

              const SizedBox(
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
