import 'package:age_calculator/age_calculator/view_model/view_models/form_validator_view_model/form_validator_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:age_calculator/age_calculator/view/age_calculator_page.dart';
import 'package:flutter_test/flutter_test.dart';

class ErrorText extends Base{}

void main(){
  final ErrorText error=ErrorText();

  testWidgets("AgeCalculatorPage - Empty Form Test", (WidgetTester tester)async{
    await tester.pumpWidget(MaterialApp(home: AgeCalculatorPage()));
    final button=find.byType(ElevatedButton);

    await tester.tap(button);
    await tester.pump();

    expect(find.text("N.L"), findsOneWidget);
    expect(find.text("Name Lastname"), findsOneWidget);
    expect(find.text("Age: 0"), findsOneWidget);
    expect(find.text(error.birthDateTimeCanNotBeEmpty), findsOneWidget);
    expect(find.text(error.emptyNameTextFieldError), findsOneWidget);

    print("AgeCalculatorPage - Empty Form Test Passed");
  });

  testWidgets("AgeCalculatorPage - Valid Form Test", (WidgetTester tester)async{
    await tester.pumpWidget(MaterialApp(home: AgeCalculatorPage()));

    final textField=find.byKey(Key("nameTextField"));
    final datePicker=find.byKey(Key("birthDatePicker"));
    final button=find.byType(ElevatedButton);

    await tester.enterText(textField, "İsim Soyisim");

    await tester.drag(datePicker, Offset(0, 25.0)); ///Go Back For One Month

    await tester.tap(button);

    await tester.pump();
    expect(find.text("İ.S"), findsOneWidget);
    expect(find.text("İsim Soyisim"), findsWidgets);
    expect(find.text("Age: 0"), findsOneWidget);
  });

  testWidgets("AgeCalculatorPage - Missing Lastname And Future BirthDate Form Test", (WidgetTester tester)async{
    await tester.pumpWidget(MaterialApp(home: AgeCalculatorPage()));

    final textField=find.byKey(Key("nameTextField"));
    final datePicker=find.byKey(Key("birthDatePicker"));
    final button=find.byType(ElevatedButton);

    await tester.enterText(textField, "İsim");

    await tester.drag(datePicker, Offset(0, -50.0)); ///Go Future For Three Month

    await tester.tap(button);

    await tester.pump();
    expect(find.text("N.L"), findsOneWidget);
    expect(find.text("Name Lastname"), findsOneWidget);
    expect(find.text("Age: 0"), findsOneWidget);
    expect(find.text(error.birthDateCanNotAfterToday), findsOneWidget);
    expect(find.text(error.nameNotFullName), findsOneWidget);
  });
}