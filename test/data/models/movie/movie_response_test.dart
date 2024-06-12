import 'package:flutter_ci_cd/src/data/response/movie/movie_response.dart';
import 'package:flutter_ci_cd/src/domain/model/movie/movie_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data_json_mock/movie_mock.dart';

void main() {
  group('MovieResponse test', () {
    final result = (listOfMovieMock['results'] as List)
        .map((e) => MovieResponse.fromJson(e))
        .toList();
    test('[fromJson] function', () {
      expect(result, isA<List<MovieResponse>>());
    });

    test('[mapToModel] function', () {
      expect(result.first.mapToModel(), isA<MovieModel>());

      // Check [result.mapToModel().posterPath] is url.
      final uri = Uri.parse(result.first.mapToModel().posterPath);
      expect(
        uri.isAbsolute,
        true,
      );
    });
  });
}
