import 'package:flutter/material.dart';
import 'package:whatsapp/customui/buttoncart.dart';
import 'package:whatsapp/customui/contactcard.dart';
import 'package:whatsapp/model/chatmodel.dart';
import 'package:whatsapp/screens/creategroup.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(
        name: "Devstack",
        status: "A full Stack Developer",
        currentMessage: '',
        icon: '',
        id: 2,
        isGroup: false,
        time: '',
      ),
      ChatModel(
        name: "Balram",
        status: "Flutter Developer",
        currentMessage: '',
        icon: '',
        id: 3,
        isGroup: false,
        time: '',
      ),
      ChatModel(
        name: "Saket",
        status: " Developer",
        currentMessage: '',
        icon: '',
        id: 4,
        isGroup: false,
        time: '',
      ),
      ChatModel(
        name: "Dev",
        status: "A full Stack Developer",
        currentMessage: '',
        icon: '',
        id: 5,
        isGroup: false,
        time: '',
      ),
      ChatModel(
        name: "Devstack",
        status: "A full Stack Developer",
        currentMessage: '',
        icon: '',
        id: 6,
        isGroup: false,
        time: '',
      ),
      ChatModel(
        name: "Balram",
        status: "Flutter Developer",
        currentMessage: '',
        icon: '',
        id: 8,
        isGroup: false,
        time: '',
      ),
      ChatModel(
        name: "Saket",
        status: " Developer",
        currentMessage: '',
        icon: '',
        id: 7,
        isGroup: false,
        time: '',
      ),
      ChatModel(
        name: "Dev",
        status: "A full Stack Developer",
        currentMessage: '',
        icon: '',
        id: 9,
        isGroup: false,
        time: '',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Contact",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              Text(
                "256 contacts",
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
            PopupMenuButton<String>(itemBuilder: (BuildContext contesxt) {
              return [
                const PopupMenuItem(
                  child: Text("Invite a friend"),
                  value: "Invite a friend",
                ),
                const PopupMenuItem(
                  child: Text("Contacts"),
                  value: "Contacts",
                ),
                const PopupMenuItem(
                  child: Text("Refresh"),
                  value: "Refresh",
                ),
                const PopupMenuItem(
                  child: Text("Help"),
                  value: "Help",
                ),
              ];
            }),
          ]),
      body: ListView.builder(
          itemCount: contacts.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => CreateGroup()));
                },
                child: ButtonCard(
                  icon: Icons.group,
                  name: "New group",
                ),
              );
            } else if (index == 1) {
              return ButtonCard(
                icon: Icons.person_add,
                name: "New contact",
              );
            }
            return ContactCard(
              contact: contacts[index - 2],
            );
          }),
    );
  }
}
