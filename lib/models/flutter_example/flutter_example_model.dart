import 'package:flutter/material.dart';

enum FlutterExampleModelStatus {
  Ended,
  Loading,
  Error,
}

class FlutterExampleModel extends ChangeNotifier {
  FlutterExampleModelStatus _status;
  String _errorCode;
  String _errorMessage;

  String get errorCode => _errorCode;
  String get errorMessage => _errorMessage;
  FlutterExampleModelStatus get status => _status;

  FlutterExampleModel();

  FlutterExampleModel.instance() {
    //TODO Add code here
  }
  
  void getter() {
    _status = FlutterExampleModelStatus.Loading;
    notifyListeners();

    //TODO Add code here

    _status = FlutterExampleModelStatus.Ended;
    notifyListeners();
  }

  void setter() {
    _status = FlutterExampleModelStatus.Loading;
    notifyListeners();

    //TODO Add code here
    
    _status = FlutterExampleModelStatus.Ended;
    notifyListeners();
  }

  void update() {
    _status = FlutterExampleModelStatus.Loading;
    notifyListeners();

    //TODO Add code here
    
    _status = FlutterExampleModelStatus.Ended;
    notifyListeners();
  }

  void remove() {
    _status = FlutterExampleModelStatus.Loading;
    notifyListeners();

    //TODO Add code here
    
    _status = FlutterExampleModelStatus.Ended;
    notifyListeners();
  }
}