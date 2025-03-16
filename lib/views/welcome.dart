// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:projectapp/views/homePage.dart';
// import 'package:projectapp/views/signup.dart';
// import 'profile.dart';

// class WelcomePage extends StatefulWidget {
//   final String? uid; // รับ uid จาก Signup
//   const WelcomePage({super.key, this.uid});

//   @override
//   _WelcomePageState createState() => _WelcomePageState();
// }

// class _WelcomePageState extends State<WelcomePage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool isLoading = false;

//   // ดึงข้อมูลผู้ใช้จาก Firestore ตาม UID ที่ได้รับ
//   Future<Map<String, dynamic>?> fetchUserData(String uid) async {
//     try {
//       DocumentSnapshot userDoc =
//           await FirebaseFirestore.instance.collection("member").doc(uid).get();
//       if (userDoc.exists) {
//         return userDoc.data() as Map<String, dynamic>;
//       }
//     } catch (e) {
//       print("Error fetching user data: $e");
//     }
//     return null;
//   }

//   // ฟังก์ชันสำหรับการล็อกอิน
//   Future<void> loginUser(BuildContext context) async {
//     if (!_formKey.currentState!.validate()) return;

//     setState(() => isLoading = true);

//     try {
//       UserCredential userCredential =
//           await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );

//       String uid = userCredential.user!.uid;
//       Map<String, dynamic>? userData = await fetchUserData(uid);

//       if (userData != null) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => Profile(userData: userData),
//           ),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text("User data not found in Firestore"),
//           backgroundColor: Colors.red,
//         ));
//       }
//     } on FirebaseAuthException catch (e) {
//       String errorMessage = "Login failed. Please try again.";
//       if (e.code == 'user-not-found') {
//         errorMessage = "No user found with this email.";
//       } else if (e.code == 'wrong-password')
//         errorMessage = "Incorrect password.";

//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text(errorMessage),
//         backgroundColor: Colors.red,
//       ));
//     } finally {
//       setState(() => isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // พื้นหลังเหมือน Profile
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Color.fromARGB(240, 2, 173, 136),
//                   Colors.black.withOpacity(0.9),
//                   Colors.black.withOpacity(1),
//                 ],
//               ),
//             ),
//           ),
//           // ส่วนของ UI
//           SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Image.asset("assets/spotifyicon.png",
//                           width: 120, height: 120),
//                       SizedBox(height: 50),
//                       Text("Log in",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 32,
//                               fontWeight: FontWeight.bold)),
//                       SizedBox(height: 30),
//                       _buildTextField(
//                           controller: emailController,
//                           label: "Email",
//                           icon: Icons.email),
//                       SizedBox(height: 20),
//                       _buildTextField(
//                           controller: passwordController,
//                           label: "Password",
//                           icon: Icons.lock,
//                           obscureText: true),
//                       SizedBox(height: 30),
//                       isLoading
//                           ? CircularProgressIndicator()
//                           : ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.tealAccent,
//                                 foregroundColor: Colors.black,
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 32, vertical: 12),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(20)),
//                               ),
//                               onPressed: () => loginUser(context),
//                               child: Text("Continue"),
//                             ),
//                       SizedBox(height: 20),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     Signup()), // เปลี่ยนไปยังหน้า Signup
//                           );
//                         },
//                         child: Text("Don't have an account? Sign up",
//                             style: TextStyle(color: Colors.tealAccent)),
//                       ),
//                       SizedBox(height: 50),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTextField(
//       {required TextEditingController controller,
//       required String label,
//       required IconData icon,
//       bool obscureText = false}) {
//     return TextFormField(
//       controller: controller,
//       obscureText: obscureText,
//       style: TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: TextStyle(color: Colors.white70),
//         prefixIcon: Icon(icon, color: Colors.white70),
//         filled: true,
//         fillColor: Colors.white10,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) return "Please enter your $label";
//         return null;
//       },
//     );
//   }
// }
