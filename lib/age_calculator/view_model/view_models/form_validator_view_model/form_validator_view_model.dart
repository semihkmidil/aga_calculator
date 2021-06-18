import 'package:mobx/mobx.dart';

import '../../../model/person.dart';

part 'form_validator_view_model.g.dart';
part 'extensions/error_messages.dart';
part 'extensions/date_times.dart';
part 'extensions/birth_date_time_checker.dart';
part 'extensions/full_name_checker.dart';

class FormValidatorViewModel=Base with _$FormValidatorViewModel;

abstract class Base with Store{
  @observable
  String nameFieldErrorText;
  @observable
  String birthDateErrorText="";

  bool get isFormValid=>nameFieldErrorText==null&&birthDateErrorText==''; ///If errors not exist, then form is valid

  void checkFormFields({Person person}){
    checkFullName(name: person.name);
    checkBirthDateTime(birthDateTime: person.birthDateTime);
  }
}