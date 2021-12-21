import 'package:flutter/material.dart';

import 'package:whatsapp/customui/customcart.dart';
import 'package:whatsapp/model/chatmodel.dart';
import 'package:whatsapp/screens/selectcontact.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    Key? key,
    required this.chatmodels,
    required this.sourcchat,
  }) : super(key: key);
  final List<ChatModel> chatmodels;
  final ChatModel sourcchat;
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        name: "DevStack",
        isGroup: false,
        currentMessage: "Hyy DEVSTACK",
        time: "4:00",
        icon: "person.svg",
        id: 1,
        status: ''),
    ChatModel(
        name: "Kd",
        isGroup: false,
        currentMessage: "Hyy KD",
        time: "4:00",
        icon: "person.svg",
        id: 2,
        status: ''),
    ChatModel(
        name: "Kuldeep",
        isGroup: false,
        currentMessage: "Hyy Kuldeep",
        time: "4:00",
        icon: "person.svg",
        id: 3,
        status: ''),
    ChatModel(
        name: "ECE",
        isGroup: true,
        currentMessage: "Hyy Everyone",
        time: "4:00",
        icon: "group.svg",
        id: 4,
        status: ''),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => SelectContact()));
          },
          child: const Icon(Icons.chat),
        ),
        body: ListView.builder(
            itemCount: widget.chatmodels.length,
            itemBuilder: (context, index) => CustomCart(
                  chatModel: widget.chatmodels[index],
                  sourcchat: widget.sourcchat,
                )));
  }
}
