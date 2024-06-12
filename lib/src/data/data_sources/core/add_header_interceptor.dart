import 'package:dio/dio.dart';

class AddHeaderInterceptor extends Interceptor {
  final _authorization =
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZDQxYjkzZWRhNzI4YTRjM2M0OTJiY2IxMTdlYzBlZCIsInN1YiI6IjYyYTE2MDlmYzhmODU4MDA2NTI1Yjc3YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.kiLuMKecuutU2BuSjk0z65Wfo9M5IcmiSPerOL-jgJg';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    options.headers = {'Authorization': _authorization};
  }
}
