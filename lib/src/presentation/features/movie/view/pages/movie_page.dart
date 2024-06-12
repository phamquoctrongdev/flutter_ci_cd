import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/movie_provider.dart';
import '../widgets/movie_item.dart';

class MoviePage extends ConsumerWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(movieControllerProvider);
    return Scaffold(
      body: state.when(
        data: (data) => ListView.builder(
          itemBuilder: (context, position) {
            return MovieItem(movie: data[position]);
          },
          itemCount: data.length,
        ),
        error: (error, trace) => const SizedBox(),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
