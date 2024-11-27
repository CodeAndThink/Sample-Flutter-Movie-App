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
            Hero(
              tag: "${movie.title}",
              child: ClipRRect(
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
            ),
            const SizedBox(
              width: 13,
            ),
            Expanded(
                child: SizedBox(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: "${movie.id}",
                          child: Text(movie.title,
                              style: Theme.of(context).textTheme.headlineMedium,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/Star.svg",
                              height: 16,
                              width: 16,
                              colorFilter: const ColorFilter.mode(
                                  Color(0xFFFF8700), BlendMode.srcIn),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              movie.voteAverage.toString().substring(0, 3),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFFFF8700)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/Lang.svg",
                                height: 16,
                                width: 16,
                                colorFilter: ColorFilter.mode(
                                    Theme.of(context).colorScheme.primary,
                                    BlendMode.srcIn)),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              movie.originalLanguage == null
                                  ? "Unknown"
                                  : movie.originalLanguage!.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/CalendarBlank.svg",
                                height: 16,
                                width: 16,
                                fit: BoxFit.fitWidth,
                                colorFilter: ColorFilter.mode(
                                    Theme.of(context).colorScheme.primary,
                                    BlendMode.srcIn)),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(movie.releaseDate.toString().substring(0, 4),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w400))
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/Vote.svg",
                                height: 16,
                                width: 16,
                                colorFilter: ColorFilter.mode(
                                    Theme.of(context).colorScheme.primary,
                                    BlendMode.srcIn)),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              movie.voteCount.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            )
                          ],
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
