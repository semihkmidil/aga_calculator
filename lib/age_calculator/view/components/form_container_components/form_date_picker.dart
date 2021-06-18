part of '../../age_calculator_page.dart';

extension FormDatePicker on _AgeCalculatorPageState{
  Widget get formDatePickerFrame=> Expanded(
    child: Container(
      child: Column(
        children: [
          pageSubTitle(title: "Choose Your Birth Date :"),
          Container(
            child: Text(_vm.formVm.birthDateErrorText, key: Key("datePickerErrorText"), style: theme.textTheme.subtitle1.copyWith(color: Colors.red)),
            margin: EdgeInsets.only(bottom: 20.0),
          ),
          datePicker
        ],
      ),
    ),
  );

  bool get isDatePickerErrorNotExist=>_vm.formVm.birthDateErrorText==null||_vm.formVm.birthDateErrorText=="";
  DateTime get initialDatePickerDateTime=>DateTime(DateTime.now().toLocal().year, DateTime.now().toLocal().month, DateTime.now().toLocal().day);
  Widget get datePicker=>Expanded(
    child: CupertinoDatePicker(
      key: Key("birthDatePicker"),
      backgroundColor: isDatePickerErrorNotExist?Colors.white:Colors.red.withOpacity(0.15),
      initialDateTime: initialDatePickerDateTime,
      mode: CupertinoDatePickerMode.date,
      onDateTimeChanged: (DateTime newDateTime){
        _vm.personBirthDateTime=newDateTime;
      },
    ),
  );
}