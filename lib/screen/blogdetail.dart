import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spicywhips/api/authapi.dart';
import 'package:spicywhips/bloc/homebloc.dart';
import 'package:spicywhips/const/strings.dart';
import 'package:spicywhips/const/textfild.dart';
import 'package:spicywhips/modal/homemodal.dart';

class Blogdetails extends StatefulWidget {
  const Blogdetails({Key? key}) : super(key: key);

  @override
  State<Blogdetails> createState() => _BlogdetailsState();
}

class _BlogdetailsState extends State<Blogdetails> {
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    print(rcvdData['id']);
    homeBloc.fetchBlogdetails(rcvdData['id']);
    return Scaffold(
      body: StreamBuilder<BlogdetailModal>(
          stream: homeBloc.getBlogDetails.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 0, top: 40),
                      child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Image.asset("assets/backarrow.png")),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Blog",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 363,
                      height: 211,
                      child: Image.network(
                        snapshot.data!.blog!.blogThumbnail!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      snapshot.data!.blog!.name!,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      snapshot.data!.blog!.detail!,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.blog!.createdBy!.firstName!,
                              style: TextStyle(
                                  color: Color(0xff787878),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              snapshot.data!.blog!.createdAt!,
                              style: TextStyle(
                                  color: Color(0xff787878),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        snapshot.data!.checkLike!.islike == true
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : InkWell(
                                onTap: () async {
                                  AuthApi _api = AuthApi();
                                  Map data = await _api.likeBlog(
                                      blogid: rcvdData['id'],
                                      like: snapshot.data!.checkLike!.islike ==
                                              true
                                          ? false
                                          : true);

                                  if (data['status'].toString() == "200") {
                                    setState(() {
                                      homeBloc.fetchBlogdetails(rcvdData['id']);
                                    });
                                    _addNewComment(rcvdData['id']);
                                  }
                                },
                                child: Icon(Icons.favorite_outline))
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        InkWell(
                            onTap: () {},
                            child: Text(
                                snapshot.data!.blog!.numberOfLikes.toString()))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(),
                              CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://cdn.pixabay.com/photo/2021/05/04/13/29/portrait-6228705_1280.jpg")),
                              Positioned(
                                right: -30,
                                child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXwyMzQ5ODgwfHxlbnwwfHx8fA%3D%3D&w=1000&q=80")),
                              ),
                              Positioned(
                                right: -60,
                                child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGh1bWFufGVufDB8fDB8fA%3D%3D&w=1000&q=80")),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Column(
                      children: List.generate(
                          snapshot.data!.blog!.comment.length,
                          (index) => CommentCard(
                                image:
                                    snapshot.data!.blog!.comment[index].avatar!,
                                desc: snapshot
                                    .data!.blog!.comment[index].comment!,
                                name: snapshot.data!.blog!.comment[index].name!,
                                time: snapshot
                                    .data!.blog!.comment[index].commentAt!,
                              )),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  void _addNewComment(blogid) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Write a comment",
                      style: TextStyle(
                          // color: themeRed,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.close),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: TextCoustomfeild(
                    title: "Enter your Comment",
                    controller: commentController,
                    maxLines: 4,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: InkWell(
                    onTap: () async {
                      AuthApi _api = AuthApi();
                      Map data = await _api.saveComment(
                          blogid: blogid, comment: commentController.text);

                      if (data['status'].toString() == "200") {
                        Fluttertoast.showToast(msg: data['message']);
                      }

                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: themeRed),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Submit',
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

class CommentCard extends StatelessWidget {
  CommentCard(
      {Key? key,
      required this.image,
      required this.desc,
      required this.name,
      required this.time})
      : super(key: key);
  final String image;
  final String name;
  final String time;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey.withOpacity(0.2),
                backgroundImage: NetworkImage(image),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Text(time)
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    desc,
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ))
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
