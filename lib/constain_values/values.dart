class Values {
  static const appName = "Movie Wiki";
  static const language = "en-US";
  static const page = 1;
  static const includeAdult = "false";
  static const imageSmall = "w500";
  static const imageLarge = "w1280";
  static const imageUrl = "https://image.tmdb.org/t/p/";
  static const apiKey = "e9c1d0bbe10fee23ecab4da8b0e971d3";
  static const authHeader =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlOWMxZDBiYmUxMGZlZTIzZWNhYjRkYThiMGU5NzFkMyIsIm5iZiI6MTcyOTY1NTY4MS4zNTg0MDYsInN1YiI6IjY2ODE0MzU4NWNkMDlkN2ExMjQ3ZGE2OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.h3b0oOCdrTfCxjlhkvtPyMbD0uHproZfa3Og2c5_69E";
}

enum NotificationTopic {
  newsUpdates('news_updates'),
  sportsScores('sports_scores'),
  offersPromo('offers_promo'),
  locationNewYork('location_newyork');

  final String name;

  const NotificationTopic(this.name);
}
