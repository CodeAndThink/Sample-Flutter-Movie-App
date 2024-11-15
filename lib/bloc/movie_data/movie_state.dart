import 'package:movie_app/data/data_model/movie.dart';

abstract class MovieState {}

class MovieDataInit extends MovieState {}

class MovieDataLoading extends MovieState {}

class MovieDataLoaded extends MovieState {
  final List<Movie> listMovie;

  MovieDataLoaded(this.listMovie);
}

class MovieDataError extends MovieState {
  final String message;

  MovieDataError(this.message);
}