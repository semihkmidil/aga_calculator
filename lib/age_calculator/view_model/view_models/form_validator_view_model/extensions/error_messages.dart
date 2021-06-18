part of '../form_validator_view_model.dart';

extension ErrorMessages on Base{
  String get emptyNameTextFieldError=>"Name Can Not Be Empty";
  String get nameNotFullName=>"Name And Last Name Required";

  String get birthDateCanNotAfterToday=>"You can't be born in the future!";
  String get birthDateCanNotBeToday=>"Hello World! You seems to born today.";
  String get birthDateCanNotBeHundredYearsAgo=>"All dinosaurs died out years ago!";
  String get birthDateTimeCanNotBeEmpty=>"You Must Choose Your Birth Date";
}