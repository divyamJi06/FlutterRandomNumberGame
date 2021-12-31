import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myphone/main.dart';
import 'package:myphone/randomNumbergame.dart';

void main() {
  testWidgets("Finding the Play button in the homescreen and other buttons in the game screen",
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
     var playButton = find.text(("Play Random Number Game"));
    expect(playButton, findsOneWidget);
    await tester.tap(playButton);
    var bttns = find.byType(InkWell);
    expect(bttns, findsWidgets);
  });
 }
