import 'package:flutter/material.dart';
import 'package:flutter_ci_cd/src/domain/model/movie/movie_model.dart';
import 'package:flutter_ci_cd/src/presentation/constants/app_text_styles.dart';
import 'package:go_router/go_router.dart';

import '../../../../router/app_router.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.movieDetail, extra: movie.overview);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(movie.posterPath, fit: BoxFit.contain),
          const SizedBox(height: 8.0),
          Text(
            movie.originalTitle,
            style: AppTextStyles.sMilkTeaSemiBig,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          Container(
            color: Colors.black26,
            height: 16.0,
          ),
        ],
      ),
    );
  }
}
