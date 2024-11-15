import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie_data/movie_bloc.dart';
import 'package:movie_app/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:movie_app/bloc/movie_genres/movie_genre_bloc.dart';
import 'package:movie_app/data/repository/movie_repository.dart';
import 'package:movie_app/view/home_screen.dart';
import 'package:movie_app/view/theme/theme.dart';

void main() {
  final MovieRepository repository = MovieRepository();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => MovieBloc(repository)),
      BlocProvider(create: (context) => MovieDetailBloc(repository)),
      BlocProvider(create: (context) => MovieGenreBloc(repository))
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const Scaffold(
        body: Center(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
