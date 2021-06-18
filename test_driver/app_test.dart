import 'package:age_calculator/age_calculator/view_model/view_models/form_validator_view_model/form_validator_view_model.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

class ErrorText extends Base{}

void main() {
  final ErrorText errorTexts=ErrorText();

  group('Age Calculator App', () {
    final nameTextField = find.byValueKey('nameTextField');
    final birthDatePicker = find.byValueKey('birthDatePicker');
    final ageCalculatorButton = find.byValueKey("ageCalculatorButton");
    final birthDatePickerErrorText= find.byValueKey("datePickerErrorText");
    final personContainerFullName=find.byValueKey("personContainerFullName");
    final personContainerAge=find.byValueKey("personContainerAge");
    final avatarContainerText=find.byValueKey("avatarContainerText");

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      driver.close();
    });

    test('Empty Form Fields Error Validation', () async {
      await driver.tap(ageCalculatorButton);

      expect(await driver.getText(find.text(errorTexts.emptyNameTextFieldError)), errorTexts.emptyNameTextFieldError);
      expect(await driver.getText(find.text(errorTexts.birthDateTimeCanNotBeEmpty)), errorTexts.birthDateTimeCanNotBeEmpty);
    });

    test('Empty Name Field Error Validation', () async {
      await driver.scroll(birthDatePicker, 0, 25.0, Duration(seconds: 2));
      await driver.tap(ageCalculatorButton);


      expect(await driver.getText(find.text(errorTexts.emptyNameTextFieldError)), errorTexts.emptyNameTextFieldError);
      expect(await driver.getText(birthDatePickerErrorText), "");
    });

    test('Missing Full Name And False Birth Date Erro Validation', ()async{
      await driver.tap(nameTextField);
      await driver.enterText("Name");

      await driver.scroll(birthDatePicker, 0, -50.0, Duration(seconds: 1));
      await driver.tap(ageCalculatorButton);


      expect(await driver.getText(find.text(errorTexts.nameNotFullName)), errorTexts.nameNotFullName);
      expect(await driver.getText(birthDatePickerErrorText), errorTexts.birthDateCanNotAfterToday);
    });


    test('Correct Fullname And Birthdate', ()async{
      await driver.tap(nameTextField);
      await driver.enterText("example name lastname");

      await driver.scroll(birthDatePicker, 0, 100.0, Duration(seconds: 1));
      await driver.tap(ageCalculatorButton);
      await Future.delayed(Duration(seconds: 1));

      ///textFieldErrorNotExist
      expect(await driver.getText(birthDatePickerErrorText), "");
      expect(await driver.getText(personContainerFullName), "Example Name Lastname");
      expect(await driver.getText(avatarContainerText), "E.N.L");
      expect(await driver.getText(personContainerAge), "Age: 0");
    });
  });
}