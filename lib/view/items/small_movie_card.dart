import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/data/data_model/movie.dart';

class SmallMovieCard extends StatelessWidget {
  const SmallMovieCard({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Column(
            children: [
              Text(movie.title),
              Row(
                children: [
                  const Icon(FontAwesomeIcons.star),
                  Text(movie.voteAverage.round().toString())
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_border,
                    color: Colors.amber,
                  ),
                  Text(movie.voteAverage.round().toString())
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_border,
                    color: Colors.amber,
                  ),
                  Text(movie.voteAverage.round().toString())
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
