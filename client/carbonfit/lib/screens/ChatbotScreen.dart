import 'dart:convert';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  static const String BOT_URL = "https://flutter-chatbotapp.herokuapp.com";
  TextEditingController queryController = TextEditingController();
  List<String> _data = [];

  http.Client getClient() {
    return http.Client();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedList(
              key: _listKey,
              initialItemCount: _data.length,
              itemBuilder: (BuildContext context, int index,
                  Animation<double> animation) {
                return buildItem(_data[index], animation, index);
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: ColorFiltered(
              colorFilter: ColorFilter.linearToSrgbGamma(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 6.0,
                      ),
                    ],
                    color: Colors.lightGreenAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    icon: Icon(
                      Icons.message,
                      color: Colors.green.shade900,
                    ),
                    hintText: "Hi Ember!",
                    hintStyle: TextStyle(color: Colors.black54),
                    fillColor: Colors.white12,
                  ),
                  controller: queryController,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (msg) {
                    this.getResponse();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getResponse() {
    if (queryController.text.length >= 0) {
      this.insertSingleItem(queryController.text);
      var client = getClient();
      try {
        client.post(Uri.parse(BOT_URL), body: {"query": queryController.text})
          ..then((response) {
            print(response);
            Map<String, dynamic> data = jsonDecode(response.body);
            insertSingleItem(data['response'] + "<bot>");
          });
      } finally {
        client.close();
        queryController.clear();
      }
    }
  }

  void insertSingleItem(String message) {
    _data.add(message);
    _listKey.currentState!.insertItem(_data.length - 1);
  }
}

Widget buildItem(String item, Animation<double> animation, int index) {
  bool mine = item.endsWith("<bot>");
  return SizeTransition(
    sizeFactor: animation,
    child: Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        alignment: mine ? Alignment.topLeft : Alignment.topRight,
        child: Bubble(
          elevation: 1,
          color: Colors.lightGreen,
          child: Text(
            item.replaceAll("<bot>", ""),
            style: TextStyle(color: Colors.black),
          ),
          padding: BubbleEdges.all(10),
        ),
      ),
    ),
  );
}
