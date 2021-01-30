import 'package:flutter/material.dart';

class Utils {
  ///[Dialogs Widgets]
  static Future<String> showInputDialog(
    BuildContext context, {
    String lableText = 'Lable Text',
    String hintText = 'Hint Text',
    String buttonText = 'OK',
    Widget title,
  }) async {
    TextEditingController _controller = TextEditingController();
    final value = await showDialog<String>(
      context: context,
      child: AnimatedContainer(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 300),
        child: AlertDialog(
          title: title,
          contentPadding: const EdgeInsets.all(16.0),
          content: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  autofocus: true,
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: lableText,
                    hintText: hintText,
                  ),
                ),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
                child: Text(buttonText),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop(
                    _controller.text.trim().isEmpty
                        ? null
                        : _controller.text,
                  );
                }),
          ],
        ),
      ),
    );
    return value;
  }
}
