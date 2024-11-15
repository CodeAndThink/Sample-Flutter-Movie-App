import 'package:movie_app/data/data_model/movie.dart';
import 'package:movie_app/data/data_model/movie_genre.dart';
import 'package:movie_app/data/network/api_service.dart';
import 'package:movie_app/constain_values/values.dart';

class MovieRepository {
  final ApiService _apiService = ApiService();

  Future<List<Movie>> getPopularMovies(int page) async {
    final response = await _apiService.get('movie/popular', queryParameters: {
      'api_key': Values.apiKey,
      'language': Values.language,
      'page': page,
    });
    final List<dynamic> movieJsonList = response.data['results'];
    final movies = movieJsonList.map((json) => Movie.fromJson(json)).toList();
    return movies;
  }

  Future<List<MovieGenre>> getGenreMovies() async {
    final response =
        await _apiService.get('genre/movie/list', queryParameters: {
      'language': Values.language,
    });
    final List<dynamic> genresJson = response.data['genres'];
    final genres = genresJson.map((json) => MovieGenre.fromJson(json)).toList();
    return genres;
  }

  Future<Movie> getMovieDetails(int movieId) async {
    final response = await _apiService.get('movie/$movieId', queryParameters: {
      'language': Values.language,
    });
    final movieJson = response.data;
    final movie = Movie.fromJson(movieJson);
    return movie;
  }
}
