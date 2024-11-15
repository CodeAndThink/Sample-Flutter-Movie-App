import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/constain_values/values.dart';
import 'package:movie_app/data/data_model/movie.dart';

class SmallMovieCard extends StatelessWidget {
  const SmallMovieCard({super.key, required this.movie, required this.onTap});
  final Movie movie;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        child: Row(
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: Center(
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/placeholder.png',
                    image: movie.posterPath != null
                        ? Values.imageUrl +
                            Values.imageSmall +
                            movie.posterPath!
                        : 'assets/images/placeholder.png',
                    width: 100,
                    height: 120,
                    fit: BoxFit.fitWidth,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/placeholder.png',
                        width: 100,
                        height: 120,
                        fit: BoxFit.fitWidth,
                      );
                    },
                  ),
                )),
            const SizedBox(
              width: 13,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 16),
                    overflow: TextOverflow.ellipsis),
                Row(
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
                      movie.voteAverage.toString().substring(0, 3),
                      style: const TextStyle(
                          color: Color(0xFFFF8700),
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    )
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/Ticket.svg",
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.primary,
                            BlendMode.srcIn)),
                    const SizedBox(
                      width: 4,
                    ),
                    const Text(
                      "Category",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/CalendarBlank.svg",
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.primary,
                            BlendMode.srcIn)),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(movie.releaseDate.toString().substring(0, 4),
                        style: const TextStyle(fontSize: 12))
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/Clock.svg",
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.primary,
                            BlendMode.srcIn)),
                    const SizedBox(
                      width: 4,
                    ),
                    const Text(
                      "Duration",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
