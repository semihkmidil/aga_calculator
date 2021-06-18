part of "../age_calculator_page.dart";

extension FormContainer on _AgeCalculatorPageState{
  double get formContainerHeight=>screenHeightWithoutPadding*0.5;
  Widget get formContainer=>Container(
      child: Observer(
        builder: (context) => Column(
          children: [
            formTextFieldFrame,
            formDatePickerFrame
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: pageHorizontalPadding),
      height: formContainerHeight,
      width: double.infinity
  );


}