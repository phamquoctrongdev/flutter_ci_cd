import 'package:flutter_ci_cd/src/domain/repositories/movie/movie_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../data_sources/movie/movie_remote_data_source.dart';
import '../../response/movie/movie_response.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource dataSource;

  MovieRepositoryImpl(this.dataSource);

  @override
  Future<Either<Exception, List<MovieResponse>>> fetchMovies() {
    return dataSource.fetchMovies();
  }
}
