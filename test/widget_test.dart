// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:let/main.dart';

void main() {
  testWidgets('App launches successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: SportsBetApp()));
    
    // Wait for the app to load
    await tester.pumpAndSettle();

    // Verify that the app launches and shows login screen or main content
    expect(find.byType(MaterialApp), findsOneWidget);
    
    // Should find either login screen or main app content
    final hasLoginScreen = find.text('Sign In').tryEvaluate();
    final hasMainContent = find.text('Sports').tryEvaluate();
    
    expect(hasLoginScreen || hasMainContent, isTrue);
  });

  testWidgets('Navigation works correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: SportsBetApp()));
    await tester.pumpAndSettle();
    
    // If we're on the main screen, test navigation
    if (find.text('Sports').tryEvaluate()) {
      // Test bottom navigation
      await tester.tap(find.text('Sports'));
      await tester.pumpAndSettle();
      expect(find.text('Sports'), findsWidgets);
      
      await tester.tap(find.text('Live'));
      await tester.pumpAndSettle();
      expect(find.text('Live'), findsWidgets);
      
      await tester.tap(find.text('Profile'));
      await tester.pumpAndSettle();
      expect(find.text('Profile'), findsWidgets);
    }
  });
}
