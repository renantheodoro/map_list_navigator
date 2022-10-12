import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:map_navigation/designsystem/loading.dart';
import 'package:map_navigation/presentation/views/continents_section/continents_section.dart';
import 'package:map_navigation/presentation/views/map_section/map_section.dart';
import 'package:map_navigation/presentation/views/result_page.dart';
import 'package:map_navigation/presentation/views/result_page_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class ResultPageModelSpy extends Mock implements ResultPageModel {}

void main() {
  late ResultPageModel resultPageModelSpy;

  setUp(() {
    resultPageModelSpy = ResultPageModelSpy();
  });

  Future<void> _buildScreen(WidgetTester tester) async =>
      await tester.pumpWidget(Provider(
        create: (context) => resultPageModelSpy,
        builder: (context, child) => const MaterialApp(
          home: ResultPage(),
        ),
      ));

  testWidgets('should build page with correct initial widgets', (tester) async {
    when(
      () => resultPageModelSpy.initialize(),
    ).thenAnswer(
      (_) async => Future<void>,
    );

    await _buildScreen(tester);

    Finder loadFinder = find.byType(DesignSystemDnaLoader);
    expect(loadFinder, findsOneWidget);

    await tester.pump();

    Finder continentFinder = find.byType(ContinentsSection);
    expect(continentFinder, findsOneWidget);

    Finder mapFinder = find.byType(MapView);
    expect(mapFinder, findsOneWidget);

    expect(loadFinder, findsNothing);

  });

  testWidgets('should updates map position when click on population', (tester) async {
    when(
      () => resultPageModelSpy.initialize(),
    ).thenAnswer(
      (_) async => Future<void>,
    );

    await _buildScreen(tester);

    await tester.pump();

    Finder subRegionInkWellFinder = find.byKey(Key('subRegionInkWell'));

    expect(subRegionInkWellFinder, findsWidgets);

  });

  testWidgets('should build page with correct initial values', (tester) async {
    when(
      () => resultPageModelSpy.initialize(),
    ).thenAnswer(
      (_) async => Future<void>,
    );

    await _buildScreen(tester);

    await tester.pump();

    verify(
      () => resultPageModelSpy.initialize(),
    ).called(1);
  });
}
