import 'package:flutter/material.dart';
import 'package:whatsapp/customui/statuspage/headownstatus.dart';
import 'package:whatsapp/customui/statuspage/othersstatus.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 48,
            child: FloatingActionButton(
                backgroundColor: Colors.blueGrey[100],
                onPressed: () {},
                child: Icon(Icons.edit, color: Colors.blueGrey[900])),
          ),
          const SizedBox(
            height: 13,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.greenAccent[700],
            elevation: 5,
            child: const Icon(Icons.camera_alt),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: 10),
            const HeadOwnStatus(),
            label("Recrent Updates"),
            const OtherStatus(
              name: "Kuldeep Jaiswal",
              imagename: "assets/2.jpeg",
              time: "1:27",
              isseen: true,
              statusnum: 1,
            ),
            const OtherStatus(
              name: "Kd",
              imagename: "assets/2.jpeg",
              time: "1:27",
              isseen: false,
              statusnum: 2,
            ),
            const OtherStatus(
              name: "Adarsh",
              imagename: "assets/2.jpeg",
              time: "1:27",
              isseen: false,
              statusnum: 3,
            ),
            const OtherStatus(
              name: "Kdjaiswal",
              imagename: "assets/2.jpeg",
              time: "1:27",
              isseen: false,
              statusnum: 4,
            ),
            const SizedBox(
              height: 10,
            ),
            label("Viewed Status"),
            const OtherStatus(
                name: "Kd",
                imagename: "assets/2.jpeg",
                time: "1:27",
                isseen: true,
                statusnum: 5),
            const OtherStatus(
              name: "Adarsh",
              imagename: "assets/2.jpeg",
              time: "1:27",
              isseen: true,
              statusnum: 6,
            ),
            const OtherStatus(
              name: "Kdjaiswal",
              imagename: "assets/2.jpeg",
              time: "1:27",
              isseen: true,
              statusnum: 7,
            ),
          ],
        ),
      ),
    );
  }

  Widget label(String labelname) {
    return Container(
      height: 33,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        child: Text(
          labelname,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
