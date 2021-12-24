import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key, required this.number, required this.countrycode})
      : super(key: key);
  final String number;
  final String countrycode;
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // ignore: prefer_const_literals_to_create_immutables
      appBar: AppBar(
        title: Text(
          "Verify ${widget.countrycode} ${widget.number}",
          style: TextStyle(color: Colors.teal[800], fontSize: 16.5),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
            color: Colors.black,
          )
        ],
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  const TextSpan(
                      text: "We have send an sms with code",
                      style: TextStyle(color: Colors.teal, fontSize: 16.5)),
                  TextSpan(
                      text: "+" + widget.countrycode + " " + widget.number,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.5,
                          fontWeight: FontWeight.bold)),
                  const TextSpan(
                      text: "Wrong Number",
                      style: TextStyle(color: Colors.black, fontSize: 14.5)),
                ])),
            const SizedBox(height: 5),
            OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 80,
              style: const TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) {
                print("Completed: " + pin);
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Icon(
                  Icons.message,
                  color: Colors.teal,
                  size: 24,
                ),
                SizedBox(width: 25),
                Text("Resend SMS",
                    style: TextStyle(color: Colors.cyan, fontSize: 14.5))
              ],
            )
          ],
        ),
      ),
    );
  }
}
