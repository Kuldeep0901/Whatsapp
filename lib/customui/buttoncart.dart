import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore: unused_import
import 'package:flutter_svg/parser.dart';
import 'package:whatsapp/model/chatmodel.dart';

class ButtonCard extends StatelessWidget {
  ButtonCard({Key? key, required this.name, required this.icon})
      : super(key: key);
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
            radius: 23,
            child: Icon(icon, size: 26, color: Colors.white),
            backgroundColor: Color(0xFF25D366)),
        title: Text(name,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
