// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_container_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PersonContainerViewModel on Base, Store {
  final _$nameFirstLettersAtom = Atom(name: 'Base.nameFirstLetters');

  @override
  String get nameFirstLetters {
    _$nameFirstLettersAtom.reportRead();
    return super.nameFirstLetters;
  }

  @override
  set nameFirstLetters(String value) {
    _$nameFirstLettersAtom.reportWrite(value, super.nameFirstLetters, () {
      super.nameFirstLetters = value;
    });
  }

  final _$fullNameAtom = Atom(name: 'Base.fullName');

  @override
  String get fullName {
    _$fullNameAtom.reportRead();
    return super.fullName;
  }

  @override
  set fullName(String value) {
    _$fullNameAtom.reportWrite(value, super.fullName, () {
      super.fullName = value;
    });
  }

  final _$ageAtom = Atom(name: 'Base.age');

  @override
  int get age {
    _$ageAtom.reportRead();
    return super.age;
  }

  @override
  set age(int value) {
    _$ageAtom.reportWrite(value, super.age, () {
      super.age = value;
    });
  }

  @override
  String toString() {
    return '''
nameFirstLetters: ${nameFirstLetters},
fullName: ${fullName},
age: ${age}
    ''';
  }
}
