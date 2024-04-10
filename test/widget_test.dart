import 'package:catbreeds/providers/home_provider.dart';
import 'package:catbreeds/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('AppBar Test', (WidgetTester tester) async {
    final homeProvider = HomeProvider();
    await tester.pumpWidget(
      ChangeNotifierProvider<HomeProvider>(
        create: (context) => homeProvider,
        child: const MaterialApp(
          home: HomeView(),
        ),
      ),
    );
    expect(find.text('CatBreeds'), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
  });
}
