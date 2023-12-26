import 'package:flutter/material.dart';
import 'package:star_wars_app/config/color_pallete.dart';
import 'package:star_wars_app/models/character.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPallete.characterColor,
        title: Text(
          character.name!,
          style: TextStyle(
            fontSize: 30,
            color: colorPallete.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              character.name!,
              style: TextStyle(
                color: colorPallete.characterColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              character.height!,
              style: TextStyle(
                color: colorPallete.characterColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
