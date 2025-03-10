import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // พื้นหลังแบบเต็มจอ
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(240, 2, 173, 136), // สีด้านบน
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(1),
                ],
              ),
            ),
          ),

          // เนื้อหาโปรไฟล์
          SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),

                    // รูปภาพโปรไฟล์
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("assets/profile.jpeg"),
                    ),
                    SizedBox(height: 16),

                    // ชื่อผู้ใช้
                    Text(
                      "John Doe",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),

                    // ปุ่มแก้ไขโปรไฟล์
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.tealAccent, // เปลี่ยนสีปุ่ม
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        // TODO: เพิ่มฟังก์ชันแก้ไขโปรไฟล์
                      },
                      child: Text("Edit Profile"),
                    ),
                    SizedBox(height: 32),

                    // ข้อมูลโปรไฟล์
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Personal Info",
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 16),

                    ProfileInfoTile(label: "Email", value: "john.doe@example.com"),
                    ProfileInfoTile(label: "Phone", value: "+1 234 567 890"),
                    ProfileInfoTile(label: "Location", value: "New York, USA"),

                    SizedBox(height: 50), // เพิ่มระยะห่างล่างสุด
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget แสดงข้อมูลแต่ละรายการ
class ProfileInfoTile extends StatelessWidget {
  final String label;
  final String value;
  
  const ProfileInfoTile({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.white70, fontSize: 18),
          ),
          Text(
            value,
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
