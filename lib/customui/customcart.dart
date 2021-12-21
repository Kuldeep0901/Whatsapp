import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:whatsapp/model/chatmodel.dart';
import 'package:whatsapp/screens/individualpage.dart';

class CustomCart extends StatelessWidget {
  const CustomCart({
    Key? key,
    required this.chatModel,
    required this.sourcchat,
  }) : super(key: key);
  final ChatModel chatModel;
  final ChatModel sourcchat;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IndividualPage(
                      chatModel: chatModel,
                      sourcchat: sourcchat,
                    )));
      },
      child: Column(
        children: [
          ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: SvgPicture.asset(
                  chatModel.isGroup ? "assets/group.svg" : "assets/person.svg",
                  color: Colors.white10,
                  height: 38,
                  width: 38,
                ),
                backgroundColor: Colors.blueGrey,
              ),
              title: Text(
                chatModel.name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  const Icon(Icons.done_all),
                  SizedBox(
                    width: 3,
                  ),
                  Text(chatModel.currentMessage,
                      style: const TextStyle(
                        fontSize: 13,
                      ))
                ],
              )),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
