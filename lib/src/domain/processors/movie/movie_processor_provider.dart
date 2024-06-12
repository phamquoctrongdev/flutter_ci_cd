import 'package:flutter_ci_cd/src/data/repositories/movie/movie_repository_provider.dart';
import 'package:flutter_ci_cd/src/domain/processors/movie/movie_processor_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieProcessorProvider = Provider(
  (ref) {
    final repository = ref.read(movieRepositoryProvider);
    return MovieProcessorImpl(repository);
  },
);
