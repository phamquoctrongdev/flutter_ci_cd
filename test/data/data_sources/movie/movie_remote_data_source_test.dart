import 'package:dio/dio.dart';
import 'package:flutter_ci_cd/src/data/data_sources/movie/movie_remote_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../data_json_mock/movie_mock.dart';
import 'movie_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  group('MovieDataSource', () {
    MockDio mockDioClient = MockDio();
    final dataSource = MovieRemoteDataSourceImpl(mockDioClient);
    RequestOptions requestOptions = RequestOptions();
    Response mockResponseSuccess = Response(
      requestOptions: requestOptions,
      statusCode: 200,
      data: listOfMovieMock,
    );

    // Mock interceptor
    final mockInterceptors = Interceptors();
    when(mockDioClient.interceptors).thenReturn(mockInterceptors);

    test('Fetch success', () async {
      when(mockDioClient.get(any)).thenAnswer((_) async => mockResponseSuccess);
      final actual = await dataSource.fetchMovies();
      expect(actual, isA<Right>());
    });

    test('Fetch error', () async {
      when(mockDioClient.get(any)).thenAnswer(
        (_) async => throw DioException(requestOptions: requestOptions),
      );
      final actual = await dataSource.fetchMovies();
      expect(actual, isA<Left>());
    });
  });
}
