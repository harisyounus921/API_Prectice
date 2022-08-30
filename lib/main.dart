import 'package:apiuaeage/postapi/UserWithoutModelApi.dart';
import 'package:apiuaeage/postapi/picturepost.dart';
import 'package:apiuaeage/postapi/postapi1.dart';
import 'package:apiuaeage/postapi/userapi.dart';
import 'package:apiuaeage/signup.dart';
import 'package:flutter/material.dart';

import 'UplodeImage.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UploadImageScreen(),
    );
  }
}
