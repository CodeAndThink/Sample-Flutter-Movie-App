import 'package:movie_app/data/data_model/movie.dart';

abstract class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final Movie movieData;

  MovieDetailLoaded(this.movieData);
}

class MovieDetailError extends MovieDetailState {
  final String message;

  MovieDetailError(this.message);
}