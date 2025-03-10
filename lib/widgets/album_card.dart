import 'package:flutter/material.dart';

class AlbumCard extends StatelessWidget {
  final ImageProvider image;
  final String label;
  // final Function onTap;
  const AlbumCard({
    super.key, // ใช้ super.key แทน Key key
    required this.image, // กำหนดให้ต้องใส่ค่าเสมอ
    required this.label,
    // required this.onTap, // กำหนดให้ต้องใส่ค่าเสมอ
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: image ,width: 120, height: 120,fit: BoxFit.cover,),
          SizedBox(height: 10,),
          Text(label)
        ],
      )
      );
  }
}