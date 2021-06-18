part of '../../age_calculator_page.dart';

extension FormTextField on _AgeCalculatorPageState{
  Widget get formTextFieldFrame=>Column(
      children: [
        pageSubTitle(title: "Enter Your Full Name :"),
        textField
      ],
      mainAxisSize: MainAxisSize.min
  );

  InputDecoration get textFieldInputDecoration=>InputDecoration(
    errorText: _vm.formVm.nameFieldErrorText
  );

  Widget get textField=>TextField(
    key: Key("nameTextField"),
    onChanged: (String newName){
      _vm.personName=newName;
    },
    decoration: textFieldInputDecoration,
  );
}