import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:spicywhips/auth/login.dart';
import 'package:spicywhips/bloc/homebloc.dart';
import 'package:spicywhips/const/strings.dart';
import 'package:spicywhips/const/textfild.dart';
import 'package:spicywhips/modal/homemodal.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

int addressIndex = 0;

class _CheckoutState extends State<Checkout> {
  int activeIndex = 0;
  int paymentIndex = 0;

  @override
  Widget build(BuildContext context) {
    homeBloc.fetchAddress();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backbutton(),
              SizedBox(
                height: 15,
              ),
              Text(
                "CHECKOUT",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Delivery Address",
                style: TextStyle(fontSize: 18),
              ),
              StreamBuilder<AddressModal>(
                  stream: homeBloc.getAddress.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          snapshot.data!.result.length == 0
                              ? Container()
                              : InkWell(
                                  onTap: () {
                                    setState(() {
                                      activeIndex = 1;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xffC4C4C4)),
                                        color: Color(0xffE5E5E5),
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
                                              1.3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.data!
                                                    .result[addressIndex].name!,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(snapshot
                                                  .data!
                                                  .result[addressIndex]
                                                  .address!),
                                              Text(snapshot
                                                  .data!
                                                  .result[addressIndex]
                                                  .landmark!),
                                              Text(snapshot.data!
                                                  .result[addressIndex].city!),
                                              Text(snapshot
                                                  .data!
                                                  .result[addressIndex]
                                                  .pincode!),
                                              Text(
                                                  "Mob.no- ${snapshot.data!.result[addressIndex].phone}")
                                            ],
                                          ),
                                        ),
                                        // Expanded(
                                        //     child: Icon(
                                        //   Icons.circle,
                                        //   color:
                                        //       activeIndex == 1 ? themeRed : Colors.white,
                                        // ))
                                      ],
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    );
                  }),
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/selectaddress');
                  // _addNewAddress();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(10),
                      padding: EdgeInsets.all(8),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Center(child: Text("+ Select Address")),
                      )),
                ),
              ),
              Text(
                "Payment Method",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    paymentIndex = 0;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: paymentIndex == 0
                          ? themeRed.withOpacity(0.3)
                          : Color(0xffE5E5E5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cash on delivery",
                        style: TextStyle(
                            color: paymentIndex == 0 ? themeRed : Colors.black),
                      ),
                      Icon(
                        Icons.circle,
                        color: paymentIndex == 0 ? themeRed : Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    paymentIndex = 1;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: paymentIndex == 1
                          ? themeRed.withOpacity(0.3)
                          : Color(0xffE5E5E5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Online Payment",
                        style: TextStyle(
                            color: paymentIndex == 1 ? themeRed : Colors.black),
                      ),
                      Icon(
                        Icons.circle,
                        color: paymentIndex == 1 ? themeRed : Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              InkWell(
                onTap: () {
                  _sendGift();
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xffC4C4C4))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Send as gift",
                        style: TextStyle(color: Colors.black),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text("$rupeeSymbol 2599")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/checkout');
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: themeRed),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Proceed',
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
        ),
      ),
    );
  }

  void _addNewAddress() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "NEW ADDRESS",
                style: TextStyle(
                    color: themeRed, fontWeight: FontWeight.bold, fontSize: 18),
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
              ),
              TextCoustomfeild(
                title: "Address Name",
                maxLines: 4,
              ),
              TextCoustomfeild(
                title: "Street Name",
              ),
              TextCoustomfeild(
                title: "Building Name",
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: TextCoustomfeild(
                  title: "Flat  Number",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/');
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
          );
        });
  }

  void _sendGift() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "SEND AS GIFT",
                style: TextStyle(
                    color: themeRed, fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              TextCoustomfeild(
                title: "Name",
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: TextCoustomfeild(
                  title: "Note",
                  maxLines: 4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/');
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
          );
        });
  }
}
