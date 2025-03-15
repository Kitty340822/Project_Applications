import 'package:flutter/material.dart';
import '../views/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const Profile_login());
}

class Profile_login extends StatelessWidget {
  const Profile_login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dribbble Auth App',
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}