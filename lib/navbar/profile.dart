import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spicywhips/api/homeapi.dart';
import 'package:spicywhips/auth/login.dart';
import 'package:spicywhips/bloc/homebloc.dart';
import 'package:spicywhips/const/color.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeBloc.fetchUsedetails();

    fetchMydetails();
  }

  fetchMydetails() async {
    homeBloc.liveUserDetails.listen((value) {
      _nameController.text = value.user!.firstName!;
      _phoneController.text = value.user!.phone!;
      _emailController.text = value.user!.email!;
    });
  }

  @override
  Widget build(BuildContext context) {
    homeBloc.fetchUsedetails();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backbutton(),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 8,
              ),
              child: Text(
                "EDIT PROFILE",
                style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffF0F0F0),
                  ),
                  child: Image.asset(
                    "assets/Ellipse 138 (1).png",
                    fit: BoxFit.contain,
                  )),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xffF5F5F5),
                ),
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width - 60,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(border: InputBorder.none),
                      )
                    ]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xffF5F5F5),
                ),
                padding: EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width - 60,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone",
                        style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(border: InputBorder.none),
                      )
                    ]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xffF5F5F5),
                ),
                padding: EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width - 60,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(border: InputBorder.none),
                      )
                    ]),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: InkWell(
                onTap: () async {
                  if (_nameController.text == "" ||
                      _emailController.text == "" ||
                      _phoneController.text == "") {
                    Fluttertoast.showToast(msg: "please enter all fields");
                    return;
                  }
                  HomeApi _api = HomeApi();
                  Map data = await _api.updateUserdetails(
                      name: _nameController.text,
                      email: _emailController.text,
                      phone: _phoneController.text);
                  if (data['status'].toString() == "200") {
                    Fluttertoast.showToast(msg: data['message']);
                    setState(() {
                      homeBloc.fetchUsedetails();
                    });
                  } else {
                    Fluttertoast.showToast(msg: data['message']);
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 60,
                  height: 50,
                  color: red,
                  child: Center(
                    child: Text(
                      "Save",
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
          ],
        ),
      ),
    );
  }
}
