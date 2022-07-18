import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spicywhips/api/homeapi.dart';
import 'package:spicywhips/auth/login.dart';
import 'package:spicywhips/bloc/homebloc.dart';
import 'package:spicywhips/const/strings.dart';
import 'package:spicywhips/const/textfild.dart';
import 'package:spicywhips/modal/homemodal.dart';

class EditAddress extends StatefulWidget {
  const EditAddress({Key? key}) : super(key: key);

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    print(rcvdData['id']);
    setState(() {
      addId = rcvdData['id'];
      nameController.text = rcvdData['name'];
      addressController.text = rcvdData['address'];
      landmarkController.text = rcvdData['landmark'];
      phoneController.text = rcvdData['phone'];
      stateController.text = rcvdData['city'];
      pincodeController.text = rcvdData['pincode'];
    });
  }

  String addId = "";
  @override
  Widget build(BuildContext context) {
    homeBloc.fetchAddress();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backbutton(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Edit Address',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextCoustomfeild(
                    title: "Name",
                    controller: nameController,
                  ),
                  TextCoustomfeild(
                    title: "Address Name",
                    controller: addressController,
                    maxLines: 4,
                  ),
                  TextCoustomfeild(
                    title: "landmark",
                    controller: landmarkController,
                  ),
                  TextCoustomfeild(
                    title: "phone number",
                    controller: phoneController,
                  ),
                  TextCoustomfeild(
                    title: "City",
                    controller: stateController,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: TextCoustomfeild(
                      title: "Pincode",
                      controller: pincodeController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: InkWell(
                      onTap: () async {
                        if (nameController.text == "" ||
                            addressController.text == "" ||
                            landmarkController.text == "" ||
                            stateController.text == "" ||
                            phoneController.text == "" ||
                            pincodeController.text == "") {
                          Fluttertoast.showToast(msg: 'Enter all feilds');
                          return;
                        } else {
                          HomeApi _api = HomeApi();
                          Map data = await _api.updateAddress(
                              addId: addId,
                              name: nameController.text,
                              address: addressController.text,
                              landmark: landmarkController.text,
                              city: stateController.text,
                              phone: phoneController.text,
                              pincode: pincodeController.text);

                          if (data['status'].toString() == "200") {
                            setState(() {
                              homeBloc.fetchAddress();
                            });

                            Navigator.pop(context);
                            Fluttertoast.showToast(msg: data['msg']);
                            nameController.text = "";
                            addressController.text == "";
                            landmarkController.text = "";
                            stateController.text = "";
                            phoneController.text = "";
                            pincodeController.text = "";
                          }
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: themeRed),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Done',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  deleteAddress(addressId) async {
    HomeApi _api = HomeApi();
    Map data = await _api.deleteAddress(addressId);
    if (data['status'].toString() == "200") {
      setState(() {
        homeBloc.fetchAddress();
      });
    }
  }

  void _addNewAddress() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "NEW ADDRESS",
                  style: TextStyle(
                      color: themeRed,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(
                  """Enter the details of the\nnew address """,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                TextCoustomfeild(
                  title: "Name",
                  controller: nameController,
                ),
                TextCoustomfeild(
                  title: "Address Name",
                  controller: addressController,
                  maxLines: 4,
                ),
                TextCoustomfeild(
                  title: "landmark",
                  controller: landmarkController,
                ),
                TextCoustomfeild(
                  title: "phone number",
                  controller: phoneController,
                ),
                TextCoustomfeild(
                  title: "City",
                  controller: stateController,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: TextCoustomfeild(
                    title: "Pincode",
                    controller: pincodeController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: InkWell(
                    onTap: () async {
                      if (nameController.text == "" ||
                          addressController.text == "" ||
                          landmarkController.text == "" ||
                          stateController.text == "" ||
                          phoneController.text == "" ||
                          pincodeController.text == "") {
                        Fluttertoast.showToast(msg: 'Enter all feilds');
                        return;
                      } else {
                        HomeApi _api = HomeApi();
                        Map data = await _api.addAddress(
                            name: nameController.text,
                            address: addressController.text,
                            landmark: landmarkController.text,
                            city: stateController.text,
                            phone: phoneController.text,
                            pincode: pincodeController.text);

                        if (data['status'].toString() == "200") {
                          setState(() {
                            homeBloc.fetchAddress();
                          });

                          Navigator.pop(context);
                          Fluttertoast.showToast(msg: data['msg']);
                          nameController.text = "";
                          addressController.text == "";
                          landmarkController.text = "";
                          stateController.text = "";
                          phoneController.text = "";
                          pincodeController.text = "";
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: themeRed),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Done',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          );
        });
  }
}
