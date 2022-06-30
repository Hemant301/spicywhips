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
          border: Border.all(color: Color(0xffC4C4C4))),
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

class TextCoustomfeild extends StatelessWidget {
  TextCoustomfeild(
      {Key? key,
      this.title,
      this.icon,
      this.controller,
      this.maxLength,
      this.maxLines,
      this.keyboardType})
      : super(key: key);
  String? title;
  IconData? icon;
  int? maxLength;
  int? maxLines;
  TextInputType? keyboardType;

  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.only(left: 10),
        // height: 160,
        width: MediaQuery.of(context).size.width - 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xffE5E5E5),
            border: Border.all(color: Color(0xffC4C4C4))),
        child: TextField(
          controller: controller,
          maxLines: maxLines,
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
      ),
    );
  }
}
