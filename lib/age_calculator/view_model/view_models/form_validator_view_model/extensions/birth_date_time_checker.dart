part of '../form_validator_view_model.dart';

extension BirthDateTimeChecker on Base{
  void checkBirthDateTime({DateTime birthDateTime}){
    if(birthDateTime==null){
      birthDateErrorText=birthDateTimeCanNotBeEmpty;
    }else if(today.isBefore(birthDateTime)){
      birthDateErrorText=birthDateCanNotAfterToday;
    }else if(today.isAtSameMomentAs(birthDateTime)){
      birthDateErrorText=birthDateCanNotBeToday;
    }else if(hundredYearsAgo.isAfter(birthDateTime)){
      birthDateErrorText=birthDateCanNotBeHundredYearsAgo;
    }else{
      birthDateErrorText="";
    }
  }
}