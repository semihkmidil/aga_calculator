// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_validator_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormValidatorViewModel on Base, Store {
  final _$nameFieldErrorTextAtom = Atom(name: 'Base.nameFieldErrorText');

  @override
  String get nameFieldErrorText {
    _$nameFieldErrorTextAtom.reportRead();
    return super.nameFieldErrorText;
  }

  @override
  set nameFieldErrorText(String value) {
    _$nameFieldErrorTextAtom.reportWrite(value, super.nameFieldErrorText, () {
      super.nameFieldErrorText = value;
    });
  }

  final _$birthDateErrorTextAtom = Atom(name: 'Base.birthDateErrorText');

  @override
  String get birthDateErrorText {
    _$birthDateErrorTextAtom.reportRead();
    return super.birthDateErrorText;
  }

  @override
  set birthDateErrorText(String value) {
    _$birthDateErrorTextAtom.reportWrite(value, super.birthDateErrorText, () {
      super.birthDateErrorText = value;
    });
  }

  @override
  String toString() {
    return '''
nameFieldErrorText: ${nameFieldErrorText},
birthDateErrorText: ${birthDateErrorText}
    ''';
  }
}
