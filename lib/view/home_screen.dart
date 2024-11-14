import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie_data/movie_bloc.dart';
import 'package:movie_app/bloc/movie_data/movie_event.dart';
import 'package:movie_app/bloc/movie_data/movie_state.dart';
import 'package:movie_app/data/data_model/movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // _onFetchPublicMovieList(1);
  }

  void _onFetchPublicMovieList(int page) {
    context.read<MovieBloc>().add(FetchPublicMovieList(page: page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: Text("This is home screen"),
      // body: BlocBuilder(builder: (context, state) {
      //   if (state is MovieDataLoading) {
      //     return const Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   } else if (state is MovieDataLoaded) {
      //     // return const Center(
      //     //   child: Text("Something was wrong!"),
      //     // );
      //     List<Movie> movieDatas = state.listMovie;
      //     return ListView.builder(
      //         itemCount: movieDatas.length,
      //         itemBuilder: (context, index) {
      //           return;
      //         });
      //   } else if (state is MovieDataError) {
      //     return const Center(
      //       child: Text("Something was wrong!"),
      //     );
      //   } else {
      //     return const Center(
      //       child: Text("No movie available!"),
      //     );
      //   }
      // }),
    );
  }
}
