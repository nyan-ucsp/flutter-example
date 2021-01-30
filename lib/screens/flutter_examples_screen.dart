import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/services/navigation_service.dart';

class FlutterExamplesScreen extends StatefulWidget {
  @override
  _FlutterExamplesScreenState createState() => _FlutterExamplesScreenState();
}

class _FlutterExamplesScreenState extends State<FlutterExamplesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Examples'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              OutlineButton(
                onPressed: () {
                  NavigationService.navigateTo(
                      RouteName.chooseLanguageExampleScreen);
                },
                child: Text('Choose Language'),
              ),
              SizedBox(
                height: 20,
              ),
              OutlineButton(
                onPressed: () {
                  NavigationService.navigateTo(
                      RouteName.changeDarkThemeExampleScreen);
                },
                child: Text('Dark Mode'),
              ),
              SizedBox(
                height: 20,
              ),
              OutlineButton(
                onPressed: () {
                  BotToast.showText(
                    text: " 🟢  Success",
                    onlyOne: true,
                    duration: Duration(seconds: 1),
                  );
                },
                child: Text('Bot Toast'),
              ),
              SizedBox(
                height: 20,
              ),
              OutlineButton(
                onPressed: () {
                  NavigationService.navigateTo(
                      RouteName.moorDatabaseExampleScreen);
                },
                child: Text('Moor Database Example'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
