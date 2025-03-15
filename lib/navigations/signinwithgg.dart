// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class SignInWithGooglePage extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> _signInWithGoogle(BuildContext context) async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//       if (googleUser == null) return; // ผู้ใช้ยกเลิกการเลือกบัญชี

//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       UserCredential userCredential = await _auth.signInWithCredential(credential);
//       User? user = userCredential.user;

//       if (user != null) {
//         // บันทึกข้อมูลผู้ใช้ลง Firestore
//         _firestore.collection("member").doc(user.uid).set({
//           "Email": user.email,
//           "Name": user.displayName,
//           "Password": "Google Sign-In", // ใช้ข้อความระบุว่ามาจาก Google
//         }, SetOptions(merge: true));
//       }

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Google Sign-In Successful: ${user!.email}")),
//       );

//       // นำทางไปยังหน้า Home หรือหน้าหลักของแอป
//       Navigator.pushReplacementNamed(context, '/home');
//     } catch (e) {
//       print("Google Sign-In Failed: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Google Sign-In Failed: $e")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Sign In with Google")),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => _signInWithGoogle(context),
//           child: Text("Sign In with Google"),
//         ),
//       ),
//     );
//   }
// }