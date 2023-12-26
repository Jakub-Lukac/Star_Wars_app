part of 'movies_bloc.dart';

sealed class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class LoadMovies extends MoviesEvent{
  final List<Movie> movies;

  const LoadMovies({this.movies = const <Movie> []});

  @override
  List<Object> get props => [movies];
}

class AddMovie extends MoviesEvent {
  final Movie movie;

  const AddMovie(this.movie);

  @override
  List<Object> get props => [movie];
}
