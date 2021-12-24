import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore: unused_import
import 'package:flutter_svg/parser.dart';
import 'package:whatsapp/model/chatmodel.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.contact}) : super(key: key);
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: SizedBox(
          height: 50,
          width: 50,
          child: Stack(
            children: [
              CircleAvatar(
                radius: 23,
                child: SvgPicture.asset(
                  "assets/person.svg",
                  color: Colors.white,
                  height: 30,
                  width: 30,
                ),
                backgroundColor: Colors.blueGrey[200],
              ),
              contact.select
                  ? const Positioned(
                      bottom: 4,
                      right: 5,
                      child: CircleAvatar(
                        backgroundColor: Colors.teal,
                        radius: 11,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        title: Text(contact.name,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        subtitle: Text(
          contact.status,
          style: const TextStyle(
            fontSize: 13,
          ),
        ));
  }
}
