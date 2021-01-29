import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:flutter_example/models/flutter_example/flutter_example_model.dart';
// import controller
import 'package:flutter_example/controllers/flutter_example/flutter_example_controller.dart';

class FlutterExampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterExampleController viewController = FlutterExampleController();
    return ChangeNotifierProvider<FlutterExampleModel>(
      create: (context) => FlutterExampleModel.instance(),
      child: Consumer<FlutterExampleModel>(
        builder: (context, viewModel, child) {
          return Container(
              //TODO Add layout or component here
              );
        },
      ),
    );
  }
}