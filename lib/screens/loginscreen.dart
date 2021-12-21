import 'package:flutter/material.dart';
import 'package:whatsapp/customui/buttoncart.dart';
import 'package:whatsapp/model/chatmodel.dart';
import 'package:whatsapp/screens/homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ChatModel sourcechat;
  List<ChatModel> chatmodel = [
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
    //  ChatModel(
    //     name: "ECE",
    //     isGroup: true,
    //     currentMessage: "Hyy Everyone",
    //     time: "4:00",
    //     icon: "group.svg",
    //     id: 4,
    //     status: ''),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chatmodel.length,
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                sourcechat = chatmodel.removeAt(index);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => HomeScreen(
                              chatmodels: chatmodel,
                              sourcchat: sourcechat,
                            )));
              },
              child:
                  ButtonCard(name: chatmodel[index].name, icon: Icons.person))),
    );
  }
}
