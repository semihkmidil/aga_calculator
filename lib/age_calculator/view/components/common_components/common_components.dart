part of '../../age_calculator_page.dart';


extension CommonComponents on _AgeCalculatorPageState{
  double get pageHorizontalPadding=>20.0;
  Widget pageSubTitle({String title})=>Container(
    child: Text(title, style: theme.textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold)),
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
  );
}