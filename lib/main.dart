import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgets/util/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map> userList = [
    {
      "name": "Jason Drill",
      "image": "assets/images/person1.jpeg",
      "isSelected": false
    },
    {
      "name": "Dominik Schmidt",
      "image": "assets/images/person2.jpeg",
      "isSelected": true
    },
    {
      "name": "Adrian Jay",
      "image": "assets/images/person3.jpg",
      "isSelected": false
    },
    {
      "name": "Joana Freepak",
      "image": "assets/images/person4.jpg",
      "isSelected": true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Widgets"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50,
                width: 240,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    onPressed: () {
                      showDialog(context);
                    },
                    child: const Text("Pretty BottomSheet")),
              ),
            ],
          ),
        ));
  }

  void showDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (context) => SingleChildScrollView(
              child: Container(
                height: 424,
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: 40.0,
                            height: 5.0,
                            margin: const EdgeInsets.only(top: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: HexColor("#D3D3D3"),
                            ),
                          ),
                          Container(
                              height: 36,
                              width: getWidth(context),
                              margin: const EdgeInsets.only(top: 4),
                              child: const Center(
                                child: Text(
                                  "Share question",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              )),
                          const Divider(),
                          SizedBox(
                            height: 120,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: userList.length,
                                itemBuilder: (context, index) {
                                  Map user = userList[index];

                                  String name = user["name"];
                                  String image = user["image"];
                                  bool isSelected = user["isSelected"];

                                  if (isSelected) {
                                    return SelectedUserWidget(
                                        name: name, image: image);
                                  } else {
                                    return UserWidget(name: name, image: image);
                                  }
                                }),
                          ),
                          const Divider(),
                          Container(
                            margin: const EdgeInsets.only(left: 16, top: 20),
                            child: Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 24),
                                    child: Icon(
                                      CupertinoIcons.bookmark,
                                      size: 24,
                                      color: HexColor("#777A84"),
                                    )),
                                const Text("Add question to Bookmarks",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18)),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 16, top: 28, bottom: 28),
                            child: Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 24),
                                    child: Icon(
                                      CupertinoIcons.share,
                                      size: 24,
                                      color: HexColor("#777A84"),
                                    )),
                                const Text("Share question via...",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      width: getWidth(context),
                      margin: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 32),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0))),
                          onPressed: () {
                            showDialog(context);
                          },
                          child: const Text("Send")),
                    ),
                  ],
                ),
              ),
            ));
  }
}

class UserWidget extends StatelessWidget {
  final String name;
  final String image;

  const UserWidget({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipRRect(
                child: SizedBox(
                    width: 64,
                    height: 64,
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    )),
                borderRadius: BorderRadius.circular(32),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(width: 1.5, color: HexColor("#BEBEBE"))),
                  ),
                ),
              )
            ],
          ),
          Container(
              width: 72,
              margin: const EdgeInsets.only(top: 4),
              child: Text(
                name,
                style: const TextStyle(fontSize: 12),
              ))
        ],
      ),
    );
  }
}

class SelectedUserWidget extends StatelessWidget {
  final String name;
  final String image;

  const SelectedUserWidget({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 68,
                height: 68,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(34),
                    border: Border.all(width: 1.5, color: Colors.blueAccent)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(width: 1.5, color: Colors.blueAccent)),
                    child: const Icon(
                      Icons.check_rounded,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
              width: 68,
              margin: const EdgeInsets.only(top: 4),
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12),
              ))
        ],
      ),
    );
  }
}
