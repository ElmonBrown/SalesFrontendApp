import 'package:flutter/material.dart';

class MessagesHelper{
  static void showMessage(BuildContext context, String message) {
    print(message);
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 4),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}