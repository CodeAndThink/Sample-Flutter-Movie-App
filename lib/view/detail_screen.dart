import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:movie_app/bloc/movie_detail/movie_detail_event.dart';
import 'package:movie_app/bloc/movie_detail/movie_detail_state.dart';
import 'package:movie_app/constain_values/values.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.movieId});
  final int movieId;

  @override
  DetailScreenState createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    _onFetchMovieDetail(widget.movieId);
  }

  void _onFetchMovieDetail(int movieId) {
    context.read<MovieDetailBloc>().add(FetchMovieById(movieId: movieId));
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child:
              Text("Detail", style: Theme.of(context).textTheme.headlineSmall),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/Save.svg",
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary, BlendMode.srcIn)))
        ],
      ),
      body: BlocConsumer<MovieDetailBloc, MovieDetailState>(
          listener: (context, state) {
        if (state is MovieDetailError) {
          _showBasicAlert(context);
        }
      }, builder: (context, state) {
        if (state is MovieDetailLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MovieDetailLoaded) {
          final data = state.movieData;

          return SingleChildScrollView(
            child: Stack(
              children: [
                SizedBox(
                    width: screenWidth,
                    height: screenHeight * 0.3,
                    child: Stack(
                      children: [
                        FadeInImage.assetNetwork(
                          placeholder: 'assets/images/placeholder.png',
                          image: data.backdropPath != null
                              ? Values.imageUrl +
                                  Values.imageLarge +
                                  data.backdropPath!
                              : 'assets/images/placeholder.png',
                          width: screenWidth,
                          height: screenHeight * 0.3,
                          fit: screenHeight > screenWidth
                              ? BoxFit.fitHeight
                              : BoxFit.fitWidth,
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/placeholder.png',
                              width: screenHeight * 0.3,
                              height: screenWidth,
                              fit: BoxFit.fitHeight,
                            );
                          },
                        ),
                        Positioned(
                          right: 11,
                          bottom: 9,
                          child: Container(
                            height: 24,
                            decoration: BoxDecoration(
                                color: const Color(0xFF252836),
                                borderRadius: BorderRadius.circular(12)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Star.svg",
                                  colorFilter: const ColorFilter.mode(
                                      Color(0xFFFF8700), BlendMode.srcIn),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  data.voteAverage.toString().substring(0, 3),
                                  style:
                                      const TextStyle(color: Color(0xFFFF8700)),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.3 - 60,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 120,
                            width: 100,
                            child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                child: Center(
                                  child: FadeInImage.assetNetwork(
                                    placeholder:
                                        'assets/images/placeholder.png',
                                    image: data.posterPath != null
                                        ? Values.imageUrl +
                                            Values.imageSmall +
                                            data.posterPath!
                                        : 'assets/images/placeholder.png',
                                    width: 100,
                                    height: 120,
                                    fit: BoxFit.fitWidth,
                                    imageErrorBuilder:
                                        (context, error, stackTrace) {
                                      return Image.asset(
                                        'assets/images/placeholder.png',
                                        width: 100,
                                        height: 120,
                                        fit: BoxFit.fitWidth,
                                      );
                                    },
                                  ),
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 72,
                              ),
                              Text(
                                data.title,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                                maxLines: 2,
                              )
                            ],
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/icons/CalendarBlank.svg",
                                colorFilter: ColorFilter.mode(
                                    Theme.of(context).colorScheme.secondary,
                                    BlendMode.srcIn)),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              data.releaseDate.toString().substring(0, 4),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                            ),
                            VerticalDivider(
                              color: Theme.of(context).colorScheme.secondary,
                              thickness: 1,
                              width: 24,
                            ),
                            SvgPicture.asset("assets/icons/Clock.svg",
                                colorFilter: ColorFilter.mode(
                                    Theme.of(context).colorScheme.secondary,
                                    BlendMode.srcIn)),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "${data.duration} minutes",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                            ),
                            VerticalDivider(
                              color: Theme.of(context).colorScheme.secondary,
                              thickness: 1,
                              width: 24,
                            ),
                            SvgPicture.asset("assets/icons/Ticket.svg",
                                colorFilter: ColorFilter.mode(
                                    Theme.of(context).colorScheme.secondary,
                                    BlendMode.srcIn)),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              data.genres?.first == null
                                  ? ""
                                  : data.genres!.first.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        data.overview == null ? "" : data.overview!,
                        textAlign: TextAlign.justify,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }

  void _showBasicAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Thông báo"),
          content: const Text("Đây là nội dung của alert."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Đóng"),
            ),
          ],
        );
      },
    );
  }
}
