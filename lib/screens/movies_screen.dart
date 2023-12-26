import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/bloc/movies_bloc/movies_bloc.dart';
import 'package:star_wars_app/config/color_pallete.dart';

import '../widgets/item_card.dart';
import '../widgets/skeleton.dart';
import 'detail_screens/movie_detail_scree.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movies",
          style: TextStyle(
            color: colorPallete.textColor,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: colorPallete.movieColor,
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoading) {
            return ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return const Skeleton();
              },
            );
          }

          if (state is MoviesLoaded) {
            return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return MovieDetailScreen(
                            movie: state.movies[index],
                          );
                        },
                      ),
                    );
                  },
                  child: ItemCard(
                    name: state.movies[index].title,
                    color: colorPallete.movieColor,
                  ),
                );
              },
            );
          }
          if (state is MovieError) {
            return Center(
              child: Text(
                state.errorMessage,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: colorPallete.movieColor,
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
