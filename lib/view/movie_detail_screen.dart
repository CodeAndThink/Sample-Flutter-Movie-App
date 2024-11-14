import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  MovieDetailScreenState createState() => MovieDetailScreenState();
}

class MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("This is detail screen!"),
    );
  }
}