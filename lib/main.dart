import 'package:flutter/material.dart';
import 'outlook.dart';
import 'package:camera/camera.dart';
import 'dart:async';

List<CameraDescription> cameras;
Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatApp Clone Example',
      theme: ThemeData(
          primaryColor: Color(0XFF075E54),
          accentColor: Color(0XFF25D366) // green color for whatapp clone theme
          ),
      home: Outlook(cameras),
    );
  }
}
