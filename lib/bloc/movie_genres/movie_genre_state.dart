import 'package:movie_app/data/data_model/movie_genre.dart';

abstract class MovieGenreState {}

class MovieGenreInitial extends MovieGenreState {}

class MovieGenreLoading extends MovieGenreState {}

class MovieGenreLoaded extends MovieGenreState {
  final List<MovieGenre> genres;

  MovieGenreLoaded(this.genres);
}

class MovieGenreError extends MovieGenreState {
  final String message;

  MovieGenreError(this.message);
}