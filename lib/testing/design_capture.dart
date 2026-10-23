// Renders opt-in Flutter preview artifacts with bundled production fonts.
// Owns local PNG output in the ignored design-review directory.
// Does not compare platform-dependent pixels in CI or capture user data.
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> loadDesignFonts() async {
  final font = FontLoader('Gilroy');
  for (final weight in ['Regular', 'Medium', 'Semibold', 'Bold']) {
    font.addFont(rootBundle.load('assets/fonts/Gilroy-$weight.ttf'));
  }
  await font.load();
  await (FontLoader(
    'MaterialIcons',
  )..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf'))).load();
}

Future<void> captureDesign(WidgetTester tester, String name) async {
  if (!const bool.fromEnvironment('DESIGN_REVIEW')) return;
  final boundary = tester.renderObject<RenderRepaintBoundary>(
    find.byKey(const ValueKey('design-capture')),
  );
  await tester.runAsync(() async {
    final image = await boundary.toImage(pixelRatio: 2);
    try {
      final data = await image.toByteData(format: ui.ImageByteFormat.png);
      final folder = Directory('.dart_tool/design-review');
      await folder.create(recursive: true);
      await File(
        '${folder.path}/$name.png',
      ).writeAsBytes(data!.buffer.asUint8List());
    } finally {
      image.dispose();
    }
  });
}

Future<void> prepareDesignImages(WidgetTester tester) async {
  final context = tester.element(find.byType(MaterialApp));
  await tester.runAsync(() async {
    for (final asset in [
      'auth-landscape.webp',
      'family.webp',
      'google.png',
      'mark-black.png',
      'mark-white.png',
    ]) {
      await precacheImage(AssetImage('assets/images/' + asset), context);
    }
  });
}
