import 'package:fpdart/fpdart.dart';

import '../../model/movie/movie_model.dart';

abstract class MovieProcessor {
  Future<Either<Exception, List<MovieModel>>> fetchMovie();
}
