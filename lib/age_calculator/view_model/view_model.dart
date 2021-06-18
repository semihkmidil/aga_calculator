import '../model/person.dart';
import 'view_models/form_validator_view_model/form_validator_view_model.dart';
import 'view_models/person_container_view_model/person_container_view_model.dart';

class ViewModel{
  FormValidatorViewModel formVm=FormValidatorViewModel();
  PersonContainerViewModel personVm=PersonContainerViewModel();
  Person person=Person();

  set personName(String name){
    if(name!=null){
      name=name.replaceAll(RegExp(r"([^A-Za-ziİğĞüÜÇçöÖşŞàáäâèéëêìíïîıòóöôùúüûñçşğ]+)"), " ");
      name=name.replaceAll(RegExp(r"([\n\v\uFFFF\xFF\000\+\d]+)|( +$)|(^ +)"), "");
      person.name=name;
    }else{
      person.name=null;
    }
  }

  set personBirthDateTime(DateTime birthDateTime){
    person.birthDateTime=birthDateTime;
  }

  void checkPerson(){
    formVm.checkFormFields(person: this.person);
    if(formVm.isFormValid){
      this.person.name.toLowerCase();
      personVm.setPerson(person: this.person);
    }
  }

  DateTime get today=>formVm.today;
  DateTime get hundredYearsAgo=>formVm.hundredYearsAgo;
  DateTime get todayDateTime=>formVm.todayDateTime;
}