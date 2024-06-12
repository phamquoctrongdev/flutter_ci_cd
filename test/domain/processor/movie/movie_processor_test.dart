import 'package:flutter_ci_cd/src/data/repositories/movie/movie_repository_impl.dart';
import 'package:flutter_ci_cd/src/data/response/movie/movie_response.dart';
import 'package:flutter_ci_cd/src/domain/model/movie/movie_model.dart';
import 'package:flutter_ci_cd/src/domain/processors/movie/movie_processor_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movie_processor_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRepositoryImpl>()])
void main() {
  group('MovieProcessor', () {
    final mockRepository = MockMovieRepositoryImpl();
    final processor = MovieProcessorImpl(mockRepository);
    final mockRepositorySuccess =
        Right<Exception, List<MovieResponse>>([MovieResponse()]);
    final mockRepositoryFailed =
        Left<Exception, List<MovieResponse>>(Exception());

    test('Fetch & convert List<MovieResponse> to List<MovieModel> success', () async {
      // Mock the call [repository.fetchMovies] will return a type of Right<Exception, List<MovieResponse>>.
      provideDummy<Either<Exception, List<MovieResponse>>>(
          mockRepositorySuccess);
      when(mockRepository.fetchMovies())
          .thenAnswer((realInvocation) async => mockRepositorySuccess);
      final repositoryResult = await mockRepository.fetchMovies();
      expect(repositoryResult, isA<Right>());
      expect(repositoryResult.fold((l) => l, (r) => r), isA<List<MovieResponse>>());

      // Check the result will return List<MovieModel>.
      final actual = await processor.fetchMovie();
      expect(actual, isA<Right>());
      expect(actual.fold((l) => l, (r) => r), isA<List<MovieModel>>());
    });

    test('Fetch or convert has error', () async {
      // Mock the call [repository.fetchMovies] will return a type of Left<Exception, List<MovieResponse>>.
      when(mockRepository.fetchMovies())
          .thenAnswer((realInvocation) async => mockRepositoryFailed);
      final repositoryResult = await mockRepository.fetchMovies();
      expect(repositoryResult, isA<Left>());
      expect(repositoryResult.fold((l) => l, (r) => r), isA<Exception>());

      // Check the result is throw Exception.
      final actual = await processor.fetchMovie();
      expect(actual, isA<Left>());
      expect(actual.fold((l) => l, (r) => r), isA<Exception>());
    });
  });
}
