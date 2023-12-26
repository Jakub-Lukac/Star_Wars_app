part of 'movies_bloc.dart';

sealed class MoviesState extends Equatable {
  const MoviesState();
  
  @override
  List<Object> get props => [];
}

final class MoviesLoading extends MoviesState {}

final class MoviesLoaded extends MoviesState {
  final List<Movie> movies;

  const MoviesLoaded({this.movies = const <Movie>[]});
  
  @override
  List<Object> get props => [movies];
}

final class MovieError extends MoviesState{
  final String errorMessage;

  const MovieError(this.errorMessage);

 @override
  List<Object> get props => [errorMessage];
}
