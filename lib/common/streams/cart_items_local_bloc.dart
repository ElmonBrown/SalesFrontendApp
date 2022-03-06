import 'dart:async';

import 'package:collection/collection.dart';
import 'package:multiquimica_store_app/modules/shopping_cart/models/item.dart';

class CartItemsBloc {

  List<Item> items = [];

  //Singleton
  static final CartItemsBloc _cartItemsBloc = new CartItemsBloc._internal();

  factory CartItemsBloc() {
    return _cartItemsBloc;
  }

  CartItemsBloc._internal();

  final _cartController = StreamController<List<Item>>.broadcast();
  get allItemsStream => _cartController.stream;

  //TODO: Verify this is not causing memory leaks. This function should be called in somewhere.
  dispose() {
    _cartController.close();
  }


  getAll() async {
    _cartController.sink.add(items);
  }

  add(Item item){
    Item? obj = _find(item.code);
    if(obj != null){
      obj.cant ++;
    }
    else{
      item.cant = 1;
      items.add(item);
    }
    getAll();
  }

  remove(String itemCode){
    Item? obj = _find(itemCode);
    if(obj != null && obj.cant > 1){
      obj.cant --;
    }
    else{
      items.removeWhere((rItem) => rItem.code == itemCode);
    }


    getAll();
  }

  removeAll(){
    items.clear();
    getAll();
  }

  int getItemCant(String itemCode){
    return _find(itemCode)?.cant ?? 0;
  }

  int getSumCant(){
    return items.fold(0, (int previousValue, item) => previousValue + item.cant);
  }

  int getTotal(){
    return items.fold(0, (int previousValue, item) => previousValue + item.cant * item.price);
  }

  Item? _find(String code) => items.firstWhereOrNull((item) => item.code == code);

}