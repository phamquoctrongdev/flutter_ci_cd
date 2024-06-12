import 'package:flutter/services.dart';

class Endpoint {
  static const _rootUrl = appFlavor == 'dev'
      ? 'https://api.themoviedb.org/3'
      : 'https://api.themoviedb.org/3';

  static const String getTopRatedMovies = '$_rootUrl/movie/top_rated';
}
