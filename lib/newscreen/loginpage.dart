import 'package:flutter/material.dart';

import 'package:whatsapp/model/countrymodel.dart';
import 'package:whatsapp/newscreen/countrypage.dart';
import 'package:whatsapp/newscreen/otpscreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
    required this.setCountryData,
  }) : super(key: key);
  final Function setCountryData;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String countryname = "India";
  String countrycode = "+91";
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text("Enter Your Phone Number",
              style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.w700,
                  wordSpacing: 1,
                  fontSize: 18)),
          centerTitle: true,
          actions: const [
            Icon(
              Icons.more_vert,
              color: Colors.black,
            )
          ],
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const Text(
                "Whatsapp Will send an sms message to verify your number",
                style: TextStyle(fontSize: 13.5),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("What's my number",
                  style: TextStyle(fontSize: 13.5, color: Colors.cyan)),
              const SizedBox(
                height: 15,
              ),
              countryCard(),
              const SizedBox(
                height: 15,
              ),
              number(),
              Expanded(
                child: InkWell(
                  onTap: () {
                    if (_controller.text.length < 10) {
                      showMydilogue();
                    } else {
                      showMydilogue2();
                    }
                  },
                  child: Container(
                      color: Colors.tealAccent,
                      height: 40,
                      width: 70,
                      child: const Center(
                        child: Text(
                          "NEXT",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }

  Widget countryCard() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) =>
                    CountryPage(setCountryData: setCountryData)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.teal, width: 1.8))),
        child: Row(
          children: const [
            Expanded(
                child: Center(
              child: Text("India"),
            )),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.teal,
              size: 28,
            )
          ],
        ),
      ),
    );
  }

  Widget number() {
    return Container(
        width: MediaQuery.of(context).size.width / 1.5,
        height: 30,
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Container(
              width: 70,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.teal, width: 1.8))),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "+",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    countrycode.substring(1),
                    style: const TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.teal, width: 1.8))),
                width: MediaQuery.of(context).size.width / 1.5 - 100,
                child: TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(8),
                      hintText: "phone number"),
                ))
          ],
        ));
  }

  void setCountryData(CountryModel countryModel) {
    setState(() {
      countryname = countryModel.name;
      countrycode = countryModel.code;
    });
    Navigator.pop(context);
  }

  Future<void> showMydilogue() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("We will be verifying your phine number",
                      style: TextStyle(fontSize: 14)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(countrycode + " " + _controller.text,
                      style: const TextStyle(fontSize: 14)),
                  const Text("Is this ok or would you like to efit the number",
                      style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Edit")),
              TextButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => OtpScreen(
                                  countrycode: countrycode,
                                  number: _controller.text,
                                )));
                  })
            ],
          );
        });
  }

  Future<void> showMydilogue2() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "There is no number",
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Edit")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Ok"))
            ],
          );
        });
  }
}
