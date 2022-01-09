import 'dart:async';

import 'package:flutter/cupertino.dart';

class CartItemsBloc {

  List<Widget> items = [];

  //Singleton
  static final CartItemsBloc _cartItemsBloc = new CartItemsBloc._internal();

  factory CartItemsBloc() {
    return _cartItemsBloc;
  }

  CartItemsBloc._internal();

  //TODO: REPLACE widget class for a model
  final _cartController = StreamController<List<Widget>>.broadcast();
  get allItems => _cartController.stream;

  //TODO: Verify this is not causing memory leaks. This function should be called in somewhere.
  dispose() {
    _cartController.close();
  }


  getAll() async {
    //items = await dao.getAll();
    _cartController.sink.add(items);
  }

  //TODO: Add id employee
  add(String subject, String message){
    //dao.insert(Suggestion(subject: subject, message: message, date: DateTime.now().toString()));
    getAll();
  }
}