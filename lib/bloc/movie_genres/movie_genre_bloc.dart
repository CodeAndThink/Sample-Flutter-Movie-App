import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie_genres/movie_genre_event.dart';
import 'package:movie_app/bloc/movie_genres/movie_genre_state.dart';
import 'package:movie_app/data/data_model/movie_genre.dart';
import 'package:movie_app/data/repository/movie_repository.dart';

class MovieGenreBloc extends Bloc<MovieGenreEvent, MovieGenreState> {
  final MovieRepository repository;
  MovieGenreBloc(this.repository) : super(MovieGenreInitial()) {
    on<FetchMovieGenres>(_onFetchMovieGenres);
  }

  Future<void> _onFetchMovieGenres(
      FetchMovieGenres event, Emitter<MovieGenreState> emit) async {
    emit(MovieGenreLoading());
    try {
      final List<MovieGenre> listGenres = await repository.getGenreMovies();
      emit(MovieGenreLoaded(listGenres));
    } catch (e) {
      emit(MovieGenreError(e.toString()));
    }
  }
}
