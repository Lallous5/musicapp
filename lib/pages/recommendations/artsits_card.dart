import 'package:flutter/material.dart';
import 'package:musicapp/models/artistsModel.dart';

class ArtistCircleWidget extends StatelessWidget {
  final ArtsitModel artist;
  final bool isSelected;
  final bool isLibrary;
  final Function(bool) onSelect;

  const ArtistCircleWidget({
    Key? key,
    required this.artist,
    this.isSelected = false,
    this.isLibrary = false,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(!isSelected),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: isLibrary ? 170 : 100,
                height: isLibrary ? 170 : 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Colors.greenAccent : Colors.black,
                    width: isSelected ? 4 : 2,
                  ),
                ),
                child: ClipOval(
                  child: Image.network(
                    artist.artistImage ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (isSelected)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.greenAccent,
                    size: 20,
                  ),
                ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            artist.artistsName ?? '',
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.greenAccent : Colors.white,
            ),
          ),
          Text(
            'artist',
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.greenAccent : Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}
