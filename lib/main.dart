import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/newscreen/landingscreen.dart';
import 'package:whatsapp/screens/camerascreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "OpenSans",
          primaryColor: const Color(0xFF075E54),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: const Color(0xFF128C7E))),
      home: const LandingScreen(),
    );
  }
}
