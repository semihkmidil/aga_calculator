part of "../person_container_view_model.dart";

extension NameSetter on Base{

  void setName(String fullName){
    String tempNameFirstLetters="";
    List<String> parsedFullName=fullName.split(" ");
    fullName="";

    parsedFullName.forEach((element) {
      element=element.replaceFirst(element[0], element[0].toUpperCase());

      if(tempNameFirstLetters!=""){
        tempNameFirstLetters=tempNameFirstLetters+"."+element[0];
        fullName=fullName+" "+element;
      }else{
        tempNameFirstLetters=tempNameFirstLetters+element[0];
        fullName=fullName+element;
      }
    });

    this.fullName=fullName;
    this.nameFirstLetters=tempNameFirstLetters;
  }


}