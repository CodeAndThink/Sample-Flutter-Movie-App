import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie_data/movie_event.dart';
import 'package:movie_app/bloc/movie_data/movie_state.dart';
import 'package:movie_app/data/data_model/movie.dart';
import 'package:movie_app/data/repository/movie_repository.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository repository;
  MovieBloc(this.repository) : super(MovieDataInit()) {
    on<FetchPublicMovieList>(_onFetchPublicMovieList);
  }

  Future<void> _onFetchPublicMovieList(
      FetchPublicMovieList event, Emitter<MovieState> emit) async {
    try {
      if (state is MovieDataInit) {
        emit(MovieDataLoading());
        final List<Movie> listMovie =
            await repository.getPopularMovies(event.page);
        emit(MovieDataLoaded(listMovie));
      } else if (state is MovieDataLoaded) {
        final currentState = state as MovieDataLoaded;
        final List<Movie> currentList = currentState.listMovie;

        final List<Movie> newList =
            await repository.getPopularMovies(event.page);

        final List<Movie> updatedList = List.from(currentList)..addAll(newList);

        emit(MovieDataLoaded(updatedList));
      }
    } catch (e) {
      emit(MovieDataError(e.toString()));
    }
  }
}
