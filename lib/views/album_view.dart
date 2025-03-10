import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AlbumView extends StatefulWidget {
  const AlbumView({super.key});

  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  double _currentSliderValue = 30.0; // ค่าเริ่มต้นของ Slider

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // ปุ่มย้อนกลับ
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 30),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),

            // รูปอัลบั้ม
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage("assets/album01.jpg"), // เปลี่ยนเป็นรูปอัลบั้มจริง
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // ชื่อเพลง & ศิลปิน
            Column(
              children: [
                Text(
                  "Best mode",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  "BunReang",
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                ),
              ],
            ),

            // Slider เวลาเพลง
            Column(
              children: [
                Slider(
                  value: _currentSliderValue,
                  min: 0,
                  max: 100,
                  activeColor: Colors.green,
                  inactiveColor: Colors.white30,
                  onChanged: (value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("1:30", style: TextStyle(color: Colors.white70)),
                      Text("3:45", style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
              ],
            ),

            // // ปุ่มควบคุมเพลง
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     IconButton(
            //       icon: FaIcon(FontAwesomeIcons.backwardStep, color: Colors.white, size: 30),
            //       onPressed: () {
            //         // TODO: กดปุ่มย้อนเพลง
            //       },
            //     ),
            //     SizedBox(width: 30),
            //     IconButton(
            //       icon: FaIcon(FontAwesomeIcons.circlePlay, color: Colors.green, size: 50),
            //       onPressed: () {
            //         // TODO: กดปุ่มเล่น/หยุดเพลง
            //       },
            //     ),
            //     SizedBox(width: 30),
            //     IconButton(
            //       icon: FaIcon(FontAwesomeIcons.forwardStep, color: Colors.white, size: 30),
            //       onPressed: () {
            //         // TODO: กดปุ่มข้ามเพลง
            //       },
            //     ),
            //   ],
            // ),

            // // ปุ่มเพิ่มเติม
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     IconButton(
            //       icon: FaIcon(FontAwesomeIcons.shuffle, color: Colors.white70, size: 24),
            //       onPressed: () {
            //         // TODO: สับเปลี่ยนเพลง
            //       },
            //     ),
            //     IconButton(
            //       icon: FaIcon(FontAwesomeIcons.repeat, color: Colors.white70, size: 24),
            //       onPressed: () {
            //         // TODO: เล่นซ้ำ
            //       },
            //     ),
            //     IconButton(
            //       icon: FaIcon(FontAwesomeIcons.list, color: Colors.white70, size: 24),
            //       onPressed: () {
            //         // TODO: เปิดรายการเพลง
            //       },
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
