import 'package:flutter_ci_cd/src/domain/model/movie/movie_model.dart';
import 'package:flutter_ci_cd/src/domain/repositories/movie/movie_repository.dart';
import 'package:fpdart/fpdart.dart';

import 'movie_processor.dart';

class MovieProcessorImpl extends MovieProcessor {
  final MovieRepository repository;

  MovieProcessorImpl(this.repository);

  @override
  Future<Either<Exception, List<MovieModel>>> fetchMovie() async {
    final response = await repository.fetchMovies();
    return response.fold((left) {
      return Left(left);
    }, (right) {
      final movies = <MovieModel>[];
      right.map((e) => movies.add(e.mapToModel())).toList();
      return Right(movies);
    });
  }
}
