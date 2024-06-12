import 'package:flutter/material.dart';
import 'package:flutter_ci_cd/src/presentation/constants/app_text_styles.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          text,
          style: AppTextStyles.sBlackSemiNormal,
        ),
      ),
    );
  }
}
