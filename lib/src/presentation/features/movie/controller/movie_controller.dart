import 'dart:async';

import 'package:flutter_ci_cd/src/domain/model/movie/movie_model.dart';
import 'package:flutter_ci_cd/src/domain/processors/movie/movie_processor_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MovieController extends AsyncNotifier<List<MovieModel>> {
  @override
  Future<List<MovieModel>> build() async {
    final processor = ref.read(movieProcessorProvider);
    final response = await processor.fetchMovie();
    List<MovieModel> result = [];
    response.fold((l) {
      // TODO: Handle exception.
    }, (r) {
      result.addAll(r);
    });
    return result;
  }
}
