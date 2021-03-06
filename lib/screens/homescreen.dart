import 'package:flutter/material.dart';

import 'package:whatsapp/model/chatmodel.dart';
import 'package:whatsapp/pages/camerapage.dart';
import 'package:whatsapp/pages/chatpage.dart';
import 'package:whatsapp/pages/statuspage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.chatmodels,
    required this.sourcchat,
  }) : super(key: key);
  final List<ChatModel> chatmodels;
  final ChatModel sourcchat;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Whatsapp Clone"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton<String>(itemBuilder: (BuildContext contesxt) {
            return [
              const PopupMenuItem(
                child: Text("New group"),
                value: "New group",
              ),
              const PopupMenuItem(
                child: Text("New broadcast"),
                value: "New broadcast",
              ),
              const PopupMenuItem(
                child: Text("Whatsapp Web"),
                value: "Whatsapp Web",
              ),
              const PopupMenuItem(
                child: Text("Starred Massege"),
                value: "Starred Massege",
              ),
              const PopupMenuItem(
                child: Text("Settings"),
                value: "Settings",
              ),
            ];
          })
        ],
        bottom: TabBar(
            controller: _controller,
            indicatorColor: Colors.white,
            tabs: const [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "STATUS",
              ),
              Tab(
                text: "CALLS",
              )
            ]),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          const CameraPage(),
          ChatPage(chatmodels: widget.chatmodels, sourcchat: widget.sourcchat),
          const StatusPage(),
          const Text("Calls"),
        ],
      ),
    );
  }
}
