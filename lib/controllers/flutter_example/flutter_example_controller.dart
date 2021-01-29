import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:flutter_example/models/flutter_example/flutter_example_model.dart';

class FlutterExampleController {
  FlutterExampleController();
  
  void getter(BuildContext context) {
    FlutterExampleModel viewModel = Provider.of<FlutterExampleModel>(context, listen: false);
    //TODO Add code here for getter
    viewModel.getter();
  }

  void setter(BuildContext context) {
    FlutterExampleModel viewModel = Provider.of<FlutterExampleModel>(context, listen: false);
    //TODO Add code here for setter
    viewModel.setter();
  }

  void update(BuildContext context) {
    FlutterExampleModel viewModel = Provider.of<FlutterExampleModel>(context, listen: false);
    //TODO Add code here for update
    viewModel.update();
  }

  void remove(BuildContext context) {
    FlutterExampleModel viewModel = Provider.of<FlutterExampleModel>(context, listen: false);
    //TODO Add code here for remove
    viewModel.remove();
  }
}