import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'home_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeModel sampleListModel;

  @override
  void initState() {
    super.initState();
    sampleListModel = HomeModel();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<HomeModel>(
      model: sampleListModel,
      child: ScopedModelDescendant<HomeModel>(
        rebuildOnChange: true,
        builder: (BuildContext context, _, HomeModel model) => Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Container(
            color: Color(0xFF54678F),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  showBarcode(model),
                  showTextField(model),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container showBarcode(HomeModel model) {
    return Container(
      width: 300,
      height: 100,
      child: SfBarcodeGenerator(
        textAlign: TextAlign.justify,
        textSpacing: 10,
        value: model.phoneNumber,
        showValue: true,
        symbology: Codabar(module: 1),
      ),
    );
  }

  Container showTextField(HomeModel model) {
    return Container(
      margin: EdgeInsets.only(top: 32.0),
      width: 200,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "手機號碼",
          prefixIcon: Icon(Icons.phone),
        ),
        onSubmitted: (String phoneNumber) {
          model.enterPhoneNumber(phoneNumber);
        },
      ),
    );
  }
}
