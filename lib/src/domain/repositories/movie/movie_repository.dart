import 'package:flutter_ci_cd/src/data/response/movie/movie_response.dart';
import 'package:fpdart/fpdart.dart';

abstract class MovieRepository {
  Future<Either<Exception, List<MovieResponse>>> fetchMovies();
}
