import 'package:flutter/material.dart';
import 'package:flutter_ci_cd/main.dart';
import 'package:flutter_ci_cd/src/presentation/features/movie/view/pages/movie_detail_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MoviePage test', () {
    testWidgets('Test listview', (widgetTester) async {
      await widgetTester.pumpWidget(const MyApp());
      // Verify Loading indicator is present
      final loadingProgress = find.byType(CircularProgressIndicator);
      expect(loadingProgress, findsOneWidget);
      await widgetTester.pumpAndSettle();
      // Verify Loading indicator is disable
      expect(loadingProgress, findsNothing);
      // Verify list of movie is present.
      final movieListView = find.byType(ListView);
      expect(movieListView, findsOneWidget);

      await widgetTester.dragUntilVisible(
        find.text('12 Angry Men'), // what you want to find
        find.byType(ListView), // widget you want to scroll
        const Offset(-250, 0), // delta to move
      );

      // Verify first item of list of movie.
      final firstMovieItem = find.text('The Shawshank Redemption');
      expect(firstMovieItem, findsOneWidget);

      final detailMoviePage = find.byType(MovieDetailPage);

      expect(detailMoviePage, findsNothing);

      // Click on item.
      await widgetTester.tap(firstMovieItem);
      await widgetTester.pumpAndSettle();

      // Verify detail movie opened or not when click on item.
      expect(detailMoviePage, findsOneWidget);
    });
  });
}
