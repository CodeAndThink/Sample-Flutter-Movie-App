import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie_data/movie_bloc.dart';
import 'package:movie_app/bloc/movie_data/movie_event.dart';
import 'package:movie_app/bloc/movie_data/movie_state.dart';
import 'package:movie_app/data/data_model/movie.dart';
import 'package:movie_app/view/detail_screen.dart';
import 'package:movie_app/view/items/small_movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  int _page = 1;

  @override
  void initState() {
    super.initState();
    _onFetchPublicMovieList(_page);
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        bool isAtTop = _scrollController.position.pixels == 0;
        if (!isAtTop) {
          _page += 1;
          _onFetchPublicMovieList(_page);
        }
      }
    });
  }

  void _onFetchPublicMovieList(int page) {
    context.read<MovieBloc>().add(FetchPublicMovieList(page: page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Movies", style: Theme.of(context).textTheme.headlineSmall),
          ),
        ),
        body: BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
          if (state is MovieDataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MovieDataLoaded) {
            List<Movie> movieDatas = state.listMovie;
            return Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: movieDatas.length,
                  itemBuilder: (context, index) {
                    return SmallMovieCard(
                      movie: movieDatas[index],
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                    movieId: movieDatas[index].id)));
                      },
                    );
                  }),
            );
          } else if (state is MovieDataError) {
            return const Center(
              child: Text("Something was wrong!"),
            );
          } else {
            return const Center(
              child: Text("No movie available!"),
            );
          }
        }));
  }
}
