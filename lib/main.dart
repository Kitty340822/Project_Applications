import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // ต้อง import เพื่อใช้ Firebase
import 'package:projectapp/navigations/tabbar.dart'; // หน้า Tabbar ของคุณ
import 'package:flutter_slidable/flutter_slidable.dart';

void main() async {
  // รอให้ Firebase initialization เสร็จสิ้นก่อนที่แอปจะเริ่ม
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Firebase Initialization

  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white10,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
            fontSize: 12,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
          ),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white38, 
        ),
      ),
      home: Tabbar(), // หน้าหลักของคุณ
    );
  }
}
