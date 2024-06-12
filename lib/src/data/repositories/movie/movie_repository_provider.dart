import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data_sources/movie/movie_data_source_provider.dart';
import 'movie_repository_impl.dart';

final movieRepositoryProvider = Provider(
  (ref) {
    final dataSource = ref.read(movieRemoteDataSourceProvider);
    return MovieRepositoryImpl(dataSource);
  },
);
