import 'package:flutter/material.dart';
import 'package:flutter_ci_cd/src/presentation/features/movie/view/pages/movie_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MoviePage test', (widgetTester) async {
    await widgetTester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: MoviePage(),
        ),
      ),
    );
    final loading = find.byType(CircularProgressIndicator);
    expect(loading, findsOneWidget);

    // Call this to wait for the loading process to complete.
    await widgetTester.pumpAndSettle();

    expect(loading, findsNothing);
    final listView = find.byType(ListView);
    expect(listView, findsOneWidget);
  });
}
