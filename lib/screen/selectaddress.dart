import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spicywhips/api/homeapi.dart';
import 'package:spicywhips/auth/login.dart';
import 'package:spicywhips/bloc/homebloc.dart';
import 'package:spicywhips/const/strings.dart';
import 'package:spicywhips/const/textfild.dart';
import 'package:spicywhips/modal/homemodal.dart';
import 'package:spicywhips/screen/checkout.dart';

class Selectaddress extends StatefulWidget {
  const Selectaddress({Key? key}) : super(key: key);

  @override
  State<Selectaddress> createState() => _SelectaddressState();
}

class _SelectaddressState extends State<Selectaddress> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    homeBloc.fetchAddress();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          backbutton(),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Address',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                StreamBuilder<AddressModal>(
                    stream: homeBloc.getAddress.stream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Container();
                      }
                      return Column(
                        children: List.generate(
                            snapshot.data!.result.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        addressIndex = index;
                                        addressId =
                                            snapshot.data!.result[index].id!;
                                        // activeIndex = index;
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffF5F5F5)),
                                          color: Color(0xffF5F5F5),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot.data!.result[index]
                                                      .name!,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(snapshot.data!
                                                    .result[index].address!),
                                                Text(snapshot.data!
                                                    .result[index].landmark!),
                                                Text(snapshot
                                                    .data!.result[index].city!),
                                                Text(snapshot.data!
                                                    .result[index].pincode!),
                                                Text(
                                                    "Mob.no- ${snapshot.data!.result[index].phone}")
                                              ],
                                            ),
                                          ),
                                          PopupMenuButton<String>(
                                            icon: Icon(
                                              Icons.more_vert_outlined,
                                              size: 35,
                                              color: Color(0xffC4C4C4),
                                            ),
                                            onSelected: (String result) {
                                              switch (result) {
                                                case 'Edit':
                                                  print('option 1 Edit');
                                                  Navigator.pushNamed(
                                                      context, '/editaddress',
                                                      arguments: {
                                                        'id': snapshot.data!
                                                            .result[index].id,
                                                        'address': snapshot
                                                            .data!
                                                            .result[index]
                                                            .address,
                                                        'landmark': snapshot
                                                            .data!
                                                            .result[index]
                                                            .landmark,
                                                        'phone': snapshot
                                                            .data!
                                                            .result[index]
                                                            .phone,
                                                        'city': snapshot.data!
                                                            .result[index].city,
                                                        'pincode': snapshot
                                                            .data!
                                                            .result[index]
                                                            .pincode,
                                                        'name': snapshot.data!
                                                            .result[index].name,
                                                      });
                                                  break;

                                                case 'Delete':
                                                  deleteAddress(snapshot
                                                      .data!.result[index].id);
                                                  print('I want to delete');
                                                  break;
                                                default:
                                              }
                                            },
                                            itemBuilder:
                                                (BuildContext context) =>
                                                    <PopupMenuEntry<String>>[
                                              const PopupMenuItem<String>(
                                                value: 'Edit',
                                                child: Text('Edit'),
                                              ),
                                              const PopupMenuItem<String>(
                                                value: 'Delete',
                                                child: Text('Delete'),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                      );
                    }),
                InkWell(
                  onTap: () {
                    _addNewAddress();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(10),
                        padding: EdgeInsets.all(8),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Center(child: Text("+ Add New Address")),
                        )),
                  ),
                ),
              ],
            ),
          )
        ],
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
