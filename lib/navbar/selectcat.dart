import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:spicywhips/api/homeapi.dart';
import 'package:spicywhips/auth/login.dart';
import 'package:spicywhips/bloc/homebloc.dart';
import 'package:spicywhips/modal/homemodal.dart';

class SelectCat extends StatefulWidget {
  const SelectCat({Key? key}) : super(key: key);

  @override
  State<SelectCat> createState() => _SelectCatState();
}

class _SelectCatState extends State<SelectCat> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkId();
  }

  checkId() async {
    Map data = await homeapi.fetchSupercat();
//    print(data['categories'][0]["_id"]);
    setState(() {
      subId = data['categories'][0]["_id"];
    });
    homeBloc.fetchSubCat("$subId");
  }

  String subId = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Image.asset("assets/backarrow.png")),
        title: Text(
          'CATEGORY',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/search');
            },
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.notifications_outlined,
            color: Colors.black,
            size: 30,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              StreamBuilder<CategoryModal>(
                  stream: homeBloc.getCategory.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          snapshot.data!.data.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  homeBloc.fetchSubCat(
                                      "${snapshot.data!.data[index].id}");
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 15),
                                color: Color(0xffF3F3F3),
                                // height: 76,
                                child: Center(
                                  child: Text(
                                    snapshot.data!.data[index].name!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Sub Category",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<SubCatModal>(
                  stream: homeBloc.getSubcat.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    }
                    return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: List.generate(
                          snapshot.data!.data.length,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/category', arguments: {
                                      'title': snapshot.data!.data[index].name
                                    });
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            24,
                                    color: Color(0xffF3F3F3),
                                    height: 76,
                                    child: Center(
                                      child: Text(
                                        snapshot.data!.data[index].name!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
