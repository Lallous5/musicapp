import 'package:flutter/material.dart';
import 'package:musicapp/models/artistsModel.dart';

class LikedSongCard extends StatelessWidget {
  // final ArtsitModel artist;
  final Function() onSelect;

  const LikedSongCard({
    Key? key,
    // required this.artist,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 170,
                height: 170,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.green,
                      Colors.greenAccent,
                      // Colors.white,
                    ],
                    // stops: [0.1, 1.0],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: ClipOval(
                    child: Icon(
                  Icons.favorite,
                  size: 55,
                  color: Colors.white,
                )),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Liked Song',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
          Text(
            '95 songs',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}
