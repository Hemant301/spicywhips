import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:spicywhips/auth/login.dart';
import 'package:spicywhips/const/strings.dart';

class Referhelp extends StatelessWidget {
  const Referhelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backbutton(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: themeRed,
                        size: 10,
                      ),
                      Text(
                        "Back",
                        style: TextStyle(color: themeRed),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Orders, Delivery & Payment",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    width: 100,
                    height: 3,
                    color: themeRed,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "FREQUENTLY ASKED QUESTIONS",
                    style: TextStyle(color: Color(0xff787878), fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("How do i check the status of my order?"),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "MORE QUERIES RELATED TO",
                    style: TextStyle(color: Color(0xff787878), fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Faqbutton(
                    answer: "anserfdsfdsf",
                    question: "Orders",
                    anserlength: 4,
                    oninnerTap: () {
                      Navigator.pushNamed(context, '/faqanswer');
                    },
                  ),
                  Faqbutton(
                    answer: "anserfdsfdsf",
                    question: "Delivery",
                    anserlength: 2,
                    oninnerTap: () {
                      Navigator.pushNamed(context, '/faqanswer');
                    },
                  ),
                  Faqbutton(
                    answer: "anserfdsfdsf",
                    question: "Payment",
                    anserlength: 3,
                    oninnerTap: () {
                      Navigator.pushNamed(context, '/faqanswer');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Faqbutton extends StatefulWidget {
  Faqbutton(
      {Key? key,
      this.question,
      this.answer,
      this.anserlength = 0,
      this.oninnerTap})
      : super(
          key: key,
        );
  String? question;
  String? answer;
  int? anserlength;
  Function()? oninnerTap;

  @override
  State<Faqbutton> createState() => _FaqbuttonState();
}

class _FaqbuttonState extends State<Faqbutton> {
  int expand = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              if (expand == 1) {
                setState(() {
                  expand = 0;
                });
              } else {
                setState(() {
                  expand = 1;
                });
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 80,
                  child: Text(
                    '${widget.question}',
                    style: const TextStyle(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: expand == 0
                      ? const Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                        )
                      : RotatedBox(
                          quarterTurns: 1,
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                          )),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          expand == 0
              ? Container()
              : Column(
                  children: List.generate(
                      widget.anserlength!,
                      (index) => Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: InkWell(
                              onTap: widget.oninnerTap,
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                color: Color(0xffF5F5F5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Was this information helpful?"),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 12,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                ),
        ],
      ),
    );
  }
}
