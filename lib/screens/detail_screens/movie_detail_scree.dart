import 'package:flutter/material.dart';
import 'package:star_wars_app/config/color_pallete.dart';


import '../../models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;
  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPallete.movieColor,
        title: Text(
          movie.title!,
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
              movie.title!,
              style: TextStyle(
                color: colorPallete.movieColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              movie.episodeId.toString(),
              style: TextStyle(
                color: colorPallete.movieColor,
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
