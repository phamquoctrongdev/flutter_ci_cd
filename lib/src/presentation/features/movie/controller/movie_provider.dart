import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/model/movie/movie_model.dart';
import 'movie_controller.dart';

final movieControllerProvider =
    AsyncNotifierProvider<MovieController, List<MovieModel>>(
  () {
    return MovieController();
  },
);
