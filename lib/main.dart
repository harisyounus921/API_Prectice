import 'package:apiuaeage/postapi/UserWithoutModelApi3.dart';
import 'package:apiuaeage/postapi/picturepost4.dart';
import 'package:apiuaeage/postapi/postapi1.dart';
import 'package:apiuaeage/postapi/userapi2.dart';
import 'package:apiuaeage/signup.dart';
import 'package:flutter/material.dart';

import 'UplodeImage.dart';
import 'postapi/postapi0.dart';

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
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: UploadImageScreen(),
    );
  }
}
