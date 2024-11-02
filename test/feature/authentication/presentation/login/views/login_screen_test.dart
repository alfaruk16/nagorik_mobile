import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:nagorik_mobile/src/feature/authentication/presentation/login/riverpod/login_provider.dart';
import 'package:nagorik_mobile/src/feature/authentication/presentation/login/views/login_screen.dart';

@GenerateNiceMocks([MockSpec<Login>()])

void main() {

  testWidgets("login screen", (tester) async {
    await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: LoginScreen())));
    await tester.pump();

    expect(find.text("Enter phone number to continue"), findsOneWidget);
    expect(find.text("Phone Number"), findsOneWidget);

    final phoneTextField = find.byKey(const Key("phoneNumberKey"));
    expect(phoneTextField, findsOneWidget);

    expect(find.text("OTP"), findsOneWidget);

    final passwordTextField = find.byKey(const Key("passwordKey"));
    expect(passwordTextField, findsOneWidget);

    expect(find.byKey(const Key("resendKey")), findsOneWidget);

    final continueButton = find.text("Continue");
    expect(continueButton, findsOneWidget);

  });
}
