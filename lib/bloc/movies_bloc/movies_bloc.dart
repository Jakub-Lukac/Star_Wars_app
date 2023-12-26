import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:star_wars_app/models/movie.dart';
import 'package:star_wars_app/services/star_wars_service.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesLoading()) {
    on<LoadMovies>(_onLoadMovies);
    on<AddMovie>(_onAddMovie);
  }

  void _onLoadMovies(LoadMovies event, Emitter<MoviesState> emit) async {
    try {
      final dio = Dio();
      final starWarsService = StarWarsService(dio);
      final Map<String, dynamic> response = await starWarsService.getMovies();

      final List<Movie> listOfMovies = (response['results'] as List)
          .map((movieJson) => Movie.fromJson(movieJson))
          .toList();

      emit(
        MoviesLoaded(movies: listOfMovies),
      );
    } catch (e) {
      emit(
        const MovieError("Failed to load movies..."),
      );
    }
  }

  void _onAddMovie(AddMovie event, Emitter<MoviesState> emit) {
    if (state is MoviesLoaded) {
      final state = this.state as MoviesLoaded;
      emit(
        MoviesLoaded(
          movies: List.from(state.movies)..add(event.movie),
        ),
      );
    }
  }
}
