import 'package:dio/dio.dart';
import 'package:flutter_ci_cd/src/data/data_sources/core/add_header_interceptor.dart';
import 'package:flutter_ci_cd/src/data/data_sources/core/endpoint.dart';
import 'package:fpdart/fpdart.dart';

import '../../response/movie/movie_response.dart';
import 'movie_remote_data_source.dart';

class MovieRemoteDataSourceImpl implements MovieDataSource {
  final Dio dio;

  MovieRemoteDataSourceImpl(this.dio);

  @override
  Future<Either<Exception, List<MovieResponse>>> fetchMovies() async {
    const url = Endpoint.getTopRatedMovies;
    try {
      dio.interceptors.add(AddHeaderInterceptor());
      final response = await dio.get(url);
      final mapFromJson = response.data['results'] as List;
      final result = mapFromJson.map((e) {
        return MovieResponse.fromJson(e);
      }).toList();
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
