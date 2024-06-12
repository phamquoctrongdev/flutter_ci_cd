import 'package:flutter_ci_cd/src/data/data_sources/movie/movie_remote_data_source_impl.dart';
import 'package:flutter_ci_cd/src/data/repositories/movie/movie_repository_impl.dart';
import 'package:flutter_ci_cd/src/data/response/movie/movie_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movie_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRemoteDataSourceImpl>()])
void main() {
  group('MovieRepository', () {
    final mockDataSource = MockMovieRemoteDataSourceImpl();
    final repository = MovieRepositoryImpl(mockDataSource);
    final mockDataSuccess =
        Right<Exception, List<MovieResponse>>([MovieResponse()]);
    final mockDataException = Left<Exception, List<MovieResponse>>(Exception());

    test('Fetch success', () async {
      provideDummy<Either<Exception, List<MovieResponse>>>(mockDataSuccess);
      when(mockDataSource.fetchMovies())
          .thenAnswer((realInvocation) async => mockDataSuccess);
      final actual = await repository.fetchMovies();
      expect(actual, isA<Right>());
    });

    test('Fetch error', () async {
      provideDummy<Either<Exception, List<MovieResponse>>>(mockDataException);
      when(mockDataSource.fetchMovies())
          .thenAnswer((realInvocation) async => mockDataException);
      final actual = await repository.fetchMovies();
      expect(actual, isA<Left>());
    });
  });
}
