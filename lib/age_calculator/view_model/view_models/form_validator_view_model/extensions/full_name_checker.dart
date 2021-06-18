part of '../form_validator_view_model.dart';

extension FullNameChecker on Base{

  void checkFullName({String name}){
    if(name==null||name==""){
      nameFieldErrorText=emptyNameTextFieldError;
    }else if(name.trim().split(" ").length<2){
      nameFieldErrorText=nameNotFullName;
    }else{
      nameFieldErrorText=null;
    }
  }
}