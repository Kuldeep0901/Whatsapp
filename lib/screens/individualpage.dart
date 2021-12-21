// ignore: avoid_web_libraries_in_flut

// ignore: import_of_legacy_library_into_null_safe

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp/customui/ownmesagecart.dart';
import 'package:whatsapp/customui/replycard.dart';
// import 'dart:js';
import 'package:whatsapp/model/chatmodel.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualPage extends StatefulWidget {
  IndividualPage({
    Key? key,
    required this.chatModel,
    required this.sourcchat,
  }) : super(key: key);
  final ChatModel chatModel;
  final ChatModel sourcchat;
  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  late IO.Socket socket;
  bool sendbutton = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  // void connect() {
  //   // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
  //   socket = IO.io("http://192.168.0.106:5000", <String, dynamic>{
  //     "transports": ["websocket"],
  //     "autoConnect": false,
  //   });
  //   socket.connect();
  //   socket.emit("signin", widget.sourcchat.id);
  //   socket.onConnect((data) {
  //     print("Connected");
  //     socket.on("message", (msg) {
  //       print(msg);
  //       // setMessage("destination", msg["message"]);
  //       // _scrollController.animateTo(_scrollController.position.maxScrollExtent,
  //           duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  //     });
  //   });
  //   print(socket.connected);
  // }
  void sendmessage(String message, int sourceid, int targetid) {
    socket.emit("message",
        {"message": message, "sourceid": sourceid, "targetid": targetid});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        "assets/whatsapp_Back.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          titleSpacing: 0,
          leadingWidth: 70,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.arrow_back,
                  size: 24,
                ),
                CircleAvatar(
                    child: SvgPicture.asset(
                      widget.chatModel.isGroup
                          ? "assets/group.svg"
                          : "assets/person.svg",
                      color: Colors.white10,
                      height: 38,
                      width: 38,
                    ),
                    radius: 20,
                    backgroundColor: Colors.blueGrey)
              ],
            ),
          ),
          title: InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chatModel.name,
                    style: const TextStyle(
                        fontSize: 18.5, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "last seen today at 12:05",
                    style: TextStyle(fontSize: 13),
                  )
                ],
              ),
            ),
          ),
          actions: [
            IconButton(icon: const Icon(Icons.videocam), onPressed: () {}),
            IconButton(icon: const Icon(Icons.call), onPressed: () {}),
            PopupMenuButton<String>(itemBuilder: (BuildContext contesxt) {
              return [
                const PopupMenuItem(
                  child: Text("View Contact"),
                  value: "View Contact",
                ),
                const PopupMenuItem(
                  child: Text("Media ,links, and Documents"),
                  value: "Media ,links, and Documents",
                ),
                const PopupMenuItem(
                  child: Text("Whatsapp Web"),
                  value: "Whatsapp Web",
                ),
                const PopupMenuItem(
                  child: Text("Search"),
                  value: "Search",
                ),
                const PopupMenuItem(
                  child: Text("Mute Notifications"),
                  value: "Mute Notifications",
                ),
                const PopupMenuItem(
                  child: Text("Wallpaper"),
                  value: "Wallpaper",
                ),
              ];
            }),
          ],
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WillPopScope(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 140,
                  child: ListView(
                    children: [
                      OwnMessageCard(
                        key: null,
                        time: 'messages[index].time,',
                        message: '',
                      ),
                      ReplyCard(
                        message: 'messages[index].time,',
                        key: null,
                        time: '',
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Card(
                                  margin: const EdgeInsets.only(
                                      left: 2, right: 2, bottom: 8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  child: TextFormField(
                                      controller: _controller,
                                      focusNode: focusNode,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 5,
                                      minLines: 1,
                                      onChanged: (value) {
                                        if (value.length > 0) {
                                          setState(() {
                                            sendbutton = true;
                                          });
                                        } else {
                                          setState(() {
                                            sendbutton = false;
                                          });
                                        }
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Type a massege",
                                        prefixIcon: IconButton(
                                          icon:
                                              const Icon(Icons.emoji_emotions),
                                          onPressed: () {
                                            focusNode.unfocus();
                                            focusNode.canRequestFocus = false;
                                            setState(() {
                                              show = !show;
                                            });
                                          },
                                        ),
                                        suffixIcon: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              icon:
                                                  const Icon(Icons.attach_file),
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (builder) =>
                                                        bottomSheet());
                                              },
                                            ),
                                            IconButton(
                                              icon:
                                                  const Icon(Icons.camera_alt),
                                              onPressed: () {},
                                            )
                                          ],
                                        ),
                                        contentPadding: const EdgeInsets.all(5),
                                      ))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 8, right: 5, left: 2),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: const Color(0xFF128C7E),
                                child: IconButton(
                                  icon: Icon(
                                      sendbutton ? Icons.send : Icons.mic,
                                      color: Colors.white),
                                  onPressed: () {
                                    if (sendbutton) {
                                      sendmessage(
                                          _controller.text,
                                          widget.sourcchat.id,
                                          widget.chatModel.id);
                                      _controller.clear();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        show ? Container() : Container(),
                      ]),
                )
              ],
            ),
            onWillPop: () {
              if (show) {
                setState(() {
                  show = false;
                });
              } else {
                Navigator.pop(context);
              }
              return Future.value(false);
            },
          ),
        ),
      ),
    ]);
  }
}

Widget bottomSheet() {
  return SizedBox(
    height: 278,
    //width: MediaQuery.of(context).size.width,
    child: Card(
      margin: const EdgeInsets.all(18),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconcreation(
                    Icons.insert_drive_file, Colors.indigo, "Document"),
                const SizedBox(
                  width: 40,
                ),
                iconcreation(Icons.camera_alt, Colors.pink, "Camera"),
                const SizedBox(
                  width: 40,
                ),
                iconcreation(Icons.insert_photo, Colors.purple, "Gallery"),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconcreation(Icons.headset, Colors.orange, "Audio"),
                const SizedBox(
                  width: 40,
                ),
                iconcreation(Icons.location_pin, Colors.teal, "Location"),
                const SizedBox(
                  width: 40,
                ),
                iconcreation(Icons.person, Colors.purple, "Contact"),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget iconcreation(IconData icon, Color color, String text) {
  return InkWell(
    onTap: () {},
    child: Column(children: [
      CircleAvatar(
        radius: 30,
        backgroundColor: color,
        child: Icon(
          icon,
          color: Colors.white,
          size: 29,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        text,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
    ]),
  );
}
// Widget emojiSelect() {
//     return EmojiPicker(
//         : 4,
//         columns: 7,
//         onEmojiSelected: (emoji, category) {
//           print(emoji);
//           setState(() {
//             _controller.text = _controller.text + emoji.emoji;
//           });
//         });
//   }