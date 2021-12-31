import 'package:flutter_test/flutter_test.dart';
import 'package:myphone/randomNumbergame.dart';

void main() {
  group("Check if the 4 digit number is same as random number:", () {
    test("100% Correct", () {
      MyHomePageState _myHomePageState = MyHomePageState();
      String givenString = "3456";
      String checkString = _myHomePageState.checkForCorrectness(givenString);
      expect(checkString, "Fully Correct");
    });
    test("Error in some digits", () {
      MyHomePageState _myHomePageState = MyHomePageState();
      String givenString = "4560";
      String checkString = _myHomePageState.checkForCorrectness(givenString);
      expect(checkString, "Partially Correct");
    });
    test("Fully Incorrect", () {
      MyHomePageState _myHomePageState = MyHomePageState();
      String givenString = "7890";
      String checkString = _myHomePageState.checkForCorrectness(givenString);
      expect(checkString, "Incorrect");
    });
  });
}
