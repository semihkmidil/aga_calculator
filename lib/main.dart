import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;
import 'package:flutter/material.dart';
import 'age_calculator/view/age_calculator_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>MaterialApp(
    home: AgeCalculatorPage(),
  );
}
