import 'package:flutter/material.dart';
import 'package:whatsapp/newscreen/loginpage.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  // ignore: non_constant_identifier_names
  get India => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
          child: Column(children: [
        const SizedBox(height: 50),
        const Text("Welcome to whatsapp",
            style: TextStyle(
                color: Colors.teal, fontSize: 29, fontWeight: FontWeight.w600)),
        SizedBox(height: MediaQuery.of(context).size.height / 8),
        Image.asset(
          "assets/bg.png",
          color: Colors.greenAccent[700],
          height: 340,
          width: 340,
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 17),
                  children: [
                    TextSpan(
                        text: "Agree and Continue to accept the",
                        style: TextStyle(color: Colors.grey)),
                    TextSpan(
                        text: "Whatsapp terma of service and privacy policy",
                        style: TextStyle(color: Colors.cyan))
                  ])),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    // ignore: prefer_const_constructors
                    builder: (builder) => LoginPage(
                          setCountryData: India,
                        )),
                (route) => false);
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 110,
            height: 50,
            child: Card(
                margin: const EdgeInsets.all(0),
                elevation: 8,
                color: Colors.greenAccent[700],
                child: const Center(
                    child: Text(
                  "AGREE AND CONTINUE",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ))),
          ),
        ),
      ])),
    ));
  }
}
