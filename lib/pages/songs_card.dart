import 'package:flutter/material.dart';

import '../models/songsModel.dart';

class SongsCard extends StatelessWidget {
  SongsModel songsModel;
  final Function() onSelect;
  int count;
  SongsCard({
    super.key,
    required this.songsModel,
    required this.count,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "$count",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              child: Image.network(
                songsModel.songImage ?? "",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                songsModel.songName ?? "",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
