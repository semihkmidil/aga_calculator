import 'package:age_calculator/age_calculator/model/person.dart';
import 'package:age_calculator/age_calculator/view_model/view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("View Model Tests", (){
    test("ViewModel - Setter Tests", (){
      ViewModel vm=ViewModel();

      ///Person Name Null
      vm.personName=null;
      expect(vm.person.name==null, true);


      ///Person Name Empty
      vm.personName="";
      expect(vm.person.name=="", true);


      ///Person Name With White Scape
      vm.personName="  A  A  ";
      expect(vm.person.name=="A A", true);


      ///Person Name With White Scape
      vm.personName="      A      A     ";
      expect(vm.person.name=="A A", true);


      ///Person Name With White Special Characters
      vm.personName="      A      A   +\n '\"..?!}][{¾&%";
      expect(vm.person.name=="A A", true);
      print("ViewModel - personName Setter Tested.");


      vm.personBirthDateTime=vm.today;
      expect(vm.person.birthDateTime==vm.today, true);
      print("ViewModel - birthDateTime Setter Tested.");
    });

    test("ViewModel - FormValidatorViewModel BirthDateTime Test",(){
      ViewModel vm=ViewModel();
      vm.personName="İsim Soyisim";


      ///False For BirthDate not selected (null)
      vm.personBirthDateTime=null;
      vm.checkPerson();
      expect(vm.formVm.isFormValid, false);


      ///False For selected BirthDate for future
      vm.personBirthDateTime=vm.today.add(Duration(days: 5));
      vm.checkPerson();
      expect(vm.formVm.isFormValid, false);


      ///False For BirthDate Equal To Today
      vm.personBirthDateTime=vm.today;
      vm.checkPerson();
      expect(vm.formVm.isFormValid, false);


      ///True For BirthDate Yesterday
      vm.personBirthDateTime=vm.today.subtract(Duration(days: 1));
      vm.checkPerson();
      expect(vm.formVm.isFormValid, true);

      ///False For selected BirthDate Before Hundred Years and one day Ago
      vm.personBirthDateTime=vm.hundredYearsAgo.subtract(Duration(days: 1));
      vm.checkPerson();
      expect(vm.formVm.isFormValid, false);

      ///True for 25 years old
      vm.personBirthDateTime=vm.today.subtract(Duration(days: 25*365, hours: 6*25));
      vm.checkPerson();
      expect(vm.formVm.isFormValid, true);

      print("ViewModel - FormValidatorViewModel BirthDateTime Tested");
    });
  });

  test("ViewModel - FormValidatorModelView FullName Test", (){
    ViewModel vm=ViewModel();
    vm.person.birthDateTime=vm.today.subtract(Duration(days: 25*365, hours: 6*25));


    ///For null name form is not valid
    vm.personName=null;
    vm.checkPerson();
    expect(vm.formVm.isFormValid, false);


    ///For empty name form is not valid
    vm.personName="";
    vm.checkPerson();
    expect(vm.formVm.isFormValid, false);


    ///For whitespacing name form is not valid
    vm.personName="   ";
    vm.checkPerson();
    expect(vm.formVm.isFormValid, false);


    ///For without lastname form is not valid
    vm.personName="  İsim ";
    vm.checkPerson();
    expect(vm.formVm.isFormValid, false);


    ///For full name form is valid
    vm.personName="  İsim Soyisim ";
    vm.checkPerson();
    expect(vm.formVm.isFormValid, true);


    print("ViewModel - FormValidatorModelView FullName Tested");
  });

  test("ViewModel - PersonContainerViewModel Test", (){
    ViewModel vm=ViewModel();
    vm.person=Person();
    String tmpNameFirstLetters=vm.personVm.nameFirstLetters;
    String tmpFullName=vm.personVm.fullName;
    int tmpAge=vm.personVm.age;

    ///For empty person It Must Not Change
    vm.checkPerson();
    expect(tmpFullName==vm.personVm.fullName, true);
    expect(tmpNameFirstLetters==vm.personVm.nameFirstLetters, true);
    expect(tmpAge==vm.personVm.age, true);

    ///For not correct full name and not correct birthDateTime it must not change.
    vm.personName="İsim";
    vm.personBirthDateTime=DateTime(2050);
    tmpNameFirstLetters=vm.personVm.nameFirstLetters;
    tmpFullName=vm.personVm.fullName;
    tmpAge=vm.personVm.age;

    vm.checkPerson();
    expect(tmpFullName==vm.personVm.fullName, true);
    expect(tmpNameFirstLetters==vm.personVm.nameFirstLetters, true);
    expect(tmpAge==vm.personVm.age, true);

    ///For correct name, not correct birthDateTime it must not change
    vm.personName="İsim Soyisim";
    vm.personBirthDateTime=DateTime(2050);
    tmpNameFirstLetters=vm.personVm.nameFirstLetters;
    tmpFullName=vm.personVm.fullName;
    tmpAge=vm.personVm.age;

    vm.checkPerson();
    expect(tmpFullName==vm.personVm.fullName, true);
    expect(tmpNameFirstLetters==vm.personVm.nameFirstLetters, true);
    expect(tmpAge==vm.personVm.age, true);

    ///For not correct name, correct birthDateTime it must not change
    vm.personName="İsim";
    vm.personBirthDateTime=DateTime(1990);
    tmpNameFirstLetters=vm.personVm.nameFirstLetters;
    tmpFullName=vm.personVm.fullName;
    tmpAge=vm.personVm.age;

    vm.checkPerson();
    expect(tmpFullName==vm.personVm.fullName, true);
    expect(tmpNameFirstLetters==vm.personVm.nameFirstLetters, true);
    expect(tmpAge==vm.personVm.age, true);

    ///For correct name and correct birth date it must change
    vm.personName="İsim Soyisim";
    vm.personBirthDateTime=DateTime(1990);///Birthdate 01/01/1990

    vm.checkPerson();
    expect(vm.personVm.fullName=="İsim Soyisim", true);
    expect(vm.personVm.nameFirstLetters=="İ.S", true);
    expect(vm.personVm.age==31, true);

    ///For Long Full Name
    vm.personName="Uzun İsim Soyisim";
    vm.personBirthDateTime=DateTime(1990);///Birthdate 01/01/1990

    vm.checkPerson();
    expect(vm.personVm.fullName=="Uzun İsim Soyisim", true);
    expect(vm.personVm.nameFirstLetters=="U.İ.S", true);
    expect(vm.personVm.age==31, true);

    ///For loverCase -> Upper case
    vm.personName="uzun isim soyisim";
    vm.personBirthDateTime=DateTime(1990);///Birthdate 01/01/1990

    vm.checkPerson();
    expect(vm.personVm.fullName=="Uzun Isim Soyisim", true);
    expect(vm.personVm.nameFirstLetters=="U.I.S", true);
    expect(vm.personVm.age==31, true);

    print("ViewModel - PersonContainerViewModel Tested");
  });

}