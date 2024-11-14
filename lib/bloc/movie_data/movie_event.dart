abstract class MovieEvent {}

class FetchPublicMovieList extends MovieEvent {
  final int page;

  FetchPublicMovieList({required this.page});
}