import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


import '../view_model/view_model.dart';

///Page Parts
part 'components/person_container.dart';
part 'components/form_container.dart';
part 'components/bottom_container.dart';

///Common Components
part 'components/common_components/common_components.dart';

///Form Container Parts
part 'components/form_container_components/form_text_field.dart';
part 'components/form_container_components/form_date_picker.dart';


class AgeCalculatorPage extends StatefulWidget {
  const AgeCalculatorPage({Key key}) : super(key: key);

  @override
  _AgeCalculatorPageState createState() => _AgeCalculatorPageState();
}

class _AgeCalculatorPageState extends State<AgeCalculatorPage> {

  ViewModel _vm=ViewModel();

  ThemeData get theme=>Theme.of(context);
  Size get pageSize=>MediaQuery.of(context).size;
  EdgeInsets get pagePadding=>MediaQuery.of(context).padding;
  double get appBarHeight=>AppBar().preferredSize.height;
  double get screenHeightWithoutPadding=>pageSize.height-pagePadding.vertical-appBarHeight;

  @override
  Widget build(BuildContext context)=>Scaffold(
    appBar: AppBar(
      title: Text("Age Calculator"),
      centerTitle: true
    ),
    body: Container(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              personContainer,
              formContainer,
              bottomContainer
            ],
          ),
        ),
      ),
      color: Colors.white,
      width: double.infinity,
      height: double.infinity
    )
  );
}
