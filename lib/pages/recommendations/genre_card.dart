import 'package:flutter/material.dart';

import 'package:musicapp/models/genreModel.dart';

class GenreSquareWidget extends StatelessWidget {
  final GenretModel genre;
  final bool isSelected;
  final Function(bool) onSelect;

  const GenreSquareWidget({
    Key? key,
    required this.genre,
    this.isSelected = false,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelect(!isSelected),
      child: Card(
        elevation: 4,
        child: Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.green : Colors.transparent,
              width: isSelected ? 4 : 2,
            ),
            borderRadius: BorderRadius.circular(12), // Set border radius
          ),
          child: Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.redAccent.shade400, Colors.redAccent.shade700],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  )
                  //  Image.network(
                  //   'https://images.pexels.com/photos/3721941/pexels-photo-3721941.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  //   width: 150,
                  //   height: 100,
                  //   fit: BoxFit.fill,
                  // ),
                  ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Transform.rotate(
                  angle: -0.349065, // 20 degrees in radians
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Text(
                      genre.genreType ?? "",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
