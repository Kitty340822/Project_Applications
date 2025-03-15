import 'package:flutter/material.dart';

class SongCard extends StatelessWidget {
  const SongCard({super.key , required this.image , required this.label});
  final AssetImage image;
  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        children: [
          Image(image: image,
          width: 140,
          height: 140,
          ),
          Text(label ,
          style: Theme.of(context).textTheme.bodySmall,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          ),
        ],
      ),
    );
  }
}