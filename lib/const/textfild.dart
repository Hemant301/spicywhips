import "package:flutter/material.dart";

class Textfiless extends StatelessWidget {
  Textfiless(
      {Key? key,
      this.title,
      this.icon,
      this.controller,
      this.maxLength,
      this.keyboardType})
      : super(key: key);
  String? title;
  IconData? icon;
  int? maxLength;
  TextInputType? keyboardType;

  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      // height: 160,
      width: MediaQuery.of(context).size.width - 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          border: Border.all(color: Color(0xffC4C4C4))
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.1),
          //     spreadRadius: 1,
          //     blurRadius: 1,
          //     offset: Offset(1, 3), // changes position of shadow
          //   ),
          // ],
          ),
      child: TextField(
        controller: controller,
        maxLength: maxLength,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            counterText: "",
            hintText: title,
            hintStyle: TextStyle(
              fontSize: 15,
              color: Color(0xff403F3F),
              fontWeight: FontWeight.bold,
            ),
            // prefixIcon: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }
}
