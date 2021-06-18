import 'package:age_calculator/age_calculator/model/person.dart';
import 'package:mobx/mobx.dart';

part 'person_container_view_model.g.dart';
part 'extensions/name_setter.dart';

class PersonContainerViewModel=Base with _$PersonContainerViewModel;

abstract class Base with Store{
  @observable
  String nameFirstLetters="N.L";
  @observable
  String fullName="Name Lastname";
  @observable
  int age=0;

  setPerson({Person person}){
    setName(person.name);
    setAge(person.birthDateTime);
  }

  void setAge(DateTime birthDateTime){
    age=((DateTime.now().toLocal().difference(birthDateTime.toLocal()).inSeconds)/(60*60*24*365.25)).floor();
  }
}