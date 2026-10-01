import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spare_website/app/app.locator.dart';
import 'package:spare_website/ui/views/home/home_view.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('HomeView Widget Test', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    testWidgets('HomeView renders brand title, highlights, and categories',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(1280, 800));

      await tester.pumpWidget(
        const MaterialApp(
          home: HomeView(),
        ),
      );

      await tester.pump();

      expect(
        find.text('Quality Spare Parts.\nFor Every Ride.'),
        findsOneWidget,
      );
      expect(
        find.text('Same-Day Delivery'),
        findsWidgets,
      );
      expect(
        find.text('24/6 Customer Support'),
        findsWidgets,
      );
      expect(
        find.text('Free Shipping Above ₹999'),
        findsWidgets,
      );
      expect(
        find.text('Spare Parts for Your Two-Wheeler'),
        findsOneWidget,
      );
      expect(
        find.text('Parts for Popular Two-Wheeler Brands'),
        findsOneWidget,
      );
    });
  });
}
