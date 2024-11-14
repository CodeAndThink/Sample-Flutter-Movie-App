import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie_detail/movie_detail_event.dart';
import 'package:movie_app/bloc/movie_detail/movie_detail_state.dart';
import 'package:movie_app/data/data_model/movie.dart';
import 'package:movie_app/data/repository/movie_repository.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MovieRepository repository;

  MovieDetailBloc(this.repository) : super(MovieDetailInitial()) {
    on<FetchMovieById>(_onFetchMovieById);
  }

  Future<void> _onFetchMovieById(
      FetchMovieById event, Emitter<MovieDetailState> emit) async {
    emit(MovieDetailLoading());
    try {
      final Movie movieData = await repository.getMovieDetails(event.movieId);
      emit(MovieDetailLoaded(movieData));
    } catch (e) {
      emit(MovieDetailError(e.toString()));
    }
  }
}
