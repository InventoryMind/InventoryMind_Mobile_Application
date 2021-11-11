import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:inventory_mind/lecturer/lecturer_dashboard.dart';
import 'package:inventory_mind/others/token_role_preferences.dart';
import 'package:inventory_mind/main.dart' as app;

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  await TokenRolePreferences.init();

  testWidgets("Lecturer", (WidgetTester tester) async {
    // await tester.pumpWidget(MaterialApp(home: LoginPage()));
    app.main();
    await tester.pumpAndSettle();

    final dropDownFinder = find.byKey(Key("UserRoleDD"));
    final lecturerFinder = find.text("Lecturer").first;
    final loginBtnFinder = find.byType(ElevatedButton);

    await tester.enterText(find.byKey(Key("Email")), "pas@xyz.com");
    await tester.enterText(find.byKey(Key("Password")), "a@52");
    await tester.pumpAndSettle();

    await tester.tap(dropDownFinder);
    await tester.pumpAndSettle();
    await tester.tap(lecturerFinder);
    await tester.pumpAndSettle();

    await tester.tap(loginBtnFinder);
    await tester.pumpAndSettle();

    expect(find.byWidget(LecturerDashboard()), findsOneWidget);
  });
}
