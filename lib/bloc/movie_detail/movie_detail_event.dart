abstract class MovieDetailEvent {}

class FetchMovieById extends MovieDetailEvent {
  final int movieId;

  FetchMovieById({required this.movieId});
}