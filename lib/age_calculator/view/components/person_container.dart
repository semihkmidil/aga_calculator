part of "../age_calculator_page.dart";

extension PersonContainer on _AgeCalculatorPageState{
  double get personContainerHeight=>screenHeightWithoutPadding*0.35;
  Widget get personContainer=>Container(
    child: Observer(
      builder: (context) => Column(
          children: [
            avatarContainer,
            SizedBox(height: 10.0),
            avatarTextContainer(text: _vm.personVm.fullName, key: "personContainerFullName", style: avatarNameTextStyle),
            avatarTextContainer(text: "Age: "+_vm.personVm.age.toString(), key: "personContainerAge", style: avatarAgeTextStyle),
          ],
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center
      ),
    ),
    padding: EdgeInsets.symmetric(horizontal: pageHorizontalPadding),
    height: personContainerHeight,
    width: double.infinity
  );

  double get avatarSize=>personContainerHeight*0.40;
  Container get avatarContainer=>Container(
    child: FittedBox(
      child: Text(_vm.personVm.nameFirstLetters, key: Key("avatarContainerText"), style: theme.textTheme.subtitle1.copyWith(color: Colors.white)),
    ),
    width: avatarSize,
    height: avatarSize,
    padding: EdgeInsets.symmetric(horizontal: avatarSize*0.1, vertical: avatarSize*0.1),
    decoration: BoxDecoration(
      color: Colors.blue,
      shape: BoxShape.circle
    ),
  );

  TextStyle get avatarAgeTextStyle=>theme.textTheme.headline5.copyWith(fontWeight: FontWeight.bold);
  TextStyle get avatarNameTextStyle=>theme.textTheme.headline6;
  double get avatarAgeTextContainerHeight=>personContainerHeight*0.15;
  Container avatarTextContainer({String text, String key, TextStyle style})=>Container(
    child: FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(text, key: Key(key), style: style),
    ),
    padding: EdgeInsets.symmetric(horizontal: pageHorizontalPadding),
    width: double.infinity,
    height: avatarAgeTextContainerHeight,
  );
}