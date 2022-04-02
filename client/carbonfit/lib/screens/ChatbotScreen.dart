import 'dart:async';
import 'package:bubble/bubble.dart';
import 'package:fixyourprint/services/ChatbotService.dart';
import 'package:flutter/material.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  ChatbotService chatbotService = ChatbotService();
  TextEditingController queryController = TextEditingController();
  ScrollController scrollController = ScrollController();
  List<String> _data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Ember - the AI Chatbot",
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: AnimatedList(
                reverse: false,
                controller: scrollController,
                key: _listKey,
                initialItemCount: _data.length,
                itemBuilder: (BuildContext context, int index,
                    Animation<double> animation) {
                  return buildItem(_data[index], animation, index);
                }),
          ),
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

                    Timer(
                        Duration(milliseconds: 2),
                        () => {
                              scrollController.jumpTo(
                                  scrollController.position.maxScrollExtent +
                                      50)
                            });
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
      try {
        chatbotService.getResponse(queryController.text)
          ..then((response) {
            print(response);
            insertSingleItem(response + "<bot>");
          });
      } finally {
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
          radius: Radius.circular(20),
          nip: mine ? BubbleNip.leftTop : BubbleNip.rightTop,
          elevation: 1,
          color: mine ? Colors.green.shade100 : Colors.lightGreen,
          child: Text(
            item.replaceAll("<bot>", ""),
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontFamily: 'Lato'),
          ),
          padding: BubbleEdges.all(10),
        ),
      ),
    ),
  );
}
