import 'package:fpdart/fpdart.dart';

import '../../response/movie/movie_response.dart';

abstract class MovieDataSource {
  Future<Either<Exception, List<MovieResponse>>> fetchMovies();
}
