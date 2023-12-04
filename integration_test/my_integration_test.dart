import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:firstapp/main1.dart' as app; // Update the import

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('tap on the Like button, verify favorites', (tester) async {
    // Load app widget.
    app.main(); // Call the main function from your app

    // Verify the initial state.
    expect(find.text('Like'), findsOneWidget);

    // Finds the Like button to tap on.
    final likeButton = find.byIcon(Icons.favorite_border);

    // Emulate a tap on the Like button.
    await tester.tap(likeButton);

    // Trigger a frame.
    await tester.pumpAndSettle();

    // Verify the Like button changes to the liked state.
    expect(find.byIcon(Icons.favorite), findsOneWidget);

    // Verify the BigCard widget is displaying the liked pair.
    expect(find.text('yourLikedPair'), findsOneWidget);
  });
}
