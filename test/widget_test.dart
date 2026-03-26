import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:mymeal_android/main.dart';

void main() {
  testWidgets('App routing smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [Provider<String>(create: (_) => 'Placeholder Provider')],
        child: const MyApp(),
      ),
    );

    // Initial route should be /login
    expect(find.text('로그인'), findsOneWidget);

    // Tap the '로그인' button to navigate to /home
    await tester.tap(find.text('로그인'));
    await tester.pumpAndSettle();

    // Verify we navigated to HomeScreen and the timeline summary is there
    expect(find.text('오늘의 식단'), findsOneWidget);
    expect(find.text('식사 기록'), findsOneWidget);

    // Check if bottom nav is rendered
    expect(find.text('홈'), findsOneWidget);
    expect(find.text('인사이트'), findsOneWidget);
  });
}
