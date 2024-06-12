import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movie_remote_data_source_impl.dart';

final movieRemoteDataSourceProvider = Provider(
  (ref) {
    final dio = Dio();
    return MovieRemoteDataSourceImpl(dio);
  },
);
