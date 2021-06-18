part of "../age_calculator_page.dart";

extension BottomContainer on _AgeCalculatorPageState{
  double get bottomContainerHeight=>screenHeightWithoutPadding*0.15;
  Widget get bottomContainer=>Container(
      child: ElevatedButton(
        key: Key("ageCalculatorButton"),
        child: Text("Calculate My Age", style: TextStyle(color: Colors.white)),
        onPressed: (){
          _vm.checkPerson();
        },
      ),
      padding: EdgeInsets.symmetric(vertical: bottomContainerHeight*0.25, horizontal: pageHorizontalPadding),
      height: bottomContainerHeight,
      width: double.infinity
  );
}