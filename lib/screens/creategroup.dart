import 'package:flutter/material.dart';
import 'package:whatsapp/customui/avatarcard.dart';
// ignore: unused_import
import 'package:whatsapp/customui/buttoncart.dart';
import 'package:whatsapp/customui/contactcard.dart';
import 'package:whatsapp/model/chatmodel.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(
      name: "Devstack",
      status: "A full Stack Developer",
      currentMessage: '',
      icon: '',
      id: 1,
      isGroup: false,
      time: '',
    ),
    ChatModel(
      name: "Balram",
      status: "Flutter Developer",
      currentMessage: '',
      icon: '',
      id: 1,
      isGroup: false,
      time: '',
    ),
    ChatModel(
      name: "Saket",
      status: " Developer",
      currentMessage: '',
      icon: '',
      id: 1,
      isGroup: false,
      time: '',
    ),
    ChatModel(
      name: "Dev",
      status: "A full Stack Developer",
      currentMessage: '',
      icon: '',
      id: 1,
      isGroup: false,
      time: '',
    ),
    ChatModel(
      name: "Devstack",
      status: "A full Stack Developer",
      currentMessage: '',
      icon: '',
      id: 1,
      isGroup: false,
      time: '',
    ),
    ChatModel(
      name: "Balram",
      status: "Flutter Developer",
      currentMessage: '',
      icon: '',
      id: 1,
      isGroup: false,
      time: '',
    ),
    ChatModel(
      name: "Saket",
      status: " Developer",
      currentMessage: '',
      icon: '',
      id: 1,
      isGroup: false,
      time: '',
    ),
    ChatModel(
      name: "Dev",
      status: "A full Stack Developer",
      currentMessage: '',
      icon: '',
      id: 1,
      isGroup: false,
      time: '',
    ),
  ];
  List<ChatModel> groupmember = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                "New Group",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Add Participants",
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 26,
                )),
          ]),
      body: Stack(children: [
        ListView.builder(
            itemCount: contacts.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  height: groupmember.isNotEmpty ? 90 : 10,
                );
              }
              return InkWell(
                  onTap: () {
                    setState(() {
                      if (contacts[index - 1].select == true) {
                        groupmember.remove(contacts[index - 1]);
                        contacts[index - 1].select = false;
                      } else {
                        groupmember.add(contacts[index - 1]);
                        contacts[index - 1].select = true;
                      }
                    });
                  },
                  child: ContactCard(contact: contacts[index - 1]));
            }),
        groupmember.isNotEmpty
            ? Column(
                children: [
                  Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          if (contacts[index].select == true) {
                            return InkWell(
                                onTap: () {
                                  setState(() {
                                    contacts[index].select = false;
                                    groupmember.remove(contacts[index]);
                                  });
                                },
                                child: AvatarCard(contact: contacts[index]));
                          } else {
                            return Container();
                          }
                        },
                      )),
                  const Divider(
                    thickness: 1,
                  )
                ],
              )
            : Container(),
      ]),
    );
  }
}
