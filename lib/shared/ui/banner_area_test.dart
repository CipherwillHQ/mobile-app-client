// Verifies multiple inline notices can share the reusable banner area.
// Owns stacked placement and empty-area regression coverage.
// Does not select account notices or trigger verification.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'banner_area.dart';

void main() {
  testWidgets('multiple banners stack in order and an empty area collapses', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: BannerArea(
            children: [Text('First notice'), Text('Second notice')],
          ),
        ),
      ),
    );
    expect(
      tester.getTopLeft(find.text('First notice')).dy,
      lessThan(tester.getTopLeft(find.text('Second notice')).dy),
    );
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: BannerArea(children: [])),
      ),
    );
    expect(tester.getSize(find.byType(BannerArea)).height, 0);
  });
}
