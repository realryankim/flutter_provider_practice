class Movie {
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  dynamic voteAverage;
  int? voteCount;

  Movie({
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
    this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        overview: json["overview"],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        title: json['title'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
      );

  // getter
  String get posterUrl => "https://image.tmdb.org/t/p/w500/$posterPath";
  String get voteAverageString => "vote average: $voteAverage";
  String get voteCountString => "vote count: $voteCount";
}
