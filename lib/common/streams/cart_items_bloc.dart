import 'dart:async';

import 'package:collection/collection.dart';
import 'package:multiquimica_store_app/modules/shopping_cart/models/item.dart';
import 'package:multiquimica_store_app/modules/shopping_cart/services/shopping_cart_service.dart';

class CartItemsBloc {
  final _service = new ShoppingCartService();
  List<Item> items = [];

  //Singleton
  static final CartItemsBloc _cartItemsBloc = new CartItemsBloc._internal();

  factory CartItemsBloc() {
    _cartItemsBloc.getAll();
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
    items = await _service.getCarItems();
    _cartController.sink.add(items);
  }

  update(Item item) async {
    if (item.cant > 0)
      await _service.updateItem(item.code, item.cant);
    else
      await _service.removeItem(item.code);

    await getAll();
  }

  add(Item item) async {
    Item? obj = _find(item.code);
    if (obj != null) {
      obj.cant++;
      await update(obj);
    }
  }

  addNew(String code, String presentationId, int cant) async {
   await _service.addItem(code, presentationId, cant);
   await getAll();
  }

  remove(String itemCode) async {
    Item? obj = _find(itemCode);
    if (obj != null) {
      obj.cant--;
      await update(obj);
    }
  }

  removeAll() {
    //items.clear();
    //getAll();
  }

  int getItemCant(String itemCode) {
    return _find(itemCode)?.cant ?? 0;
  }

  int getSumCant() {
    return items.fold(
        0, (int previousValue, item) => previousValue + item.cant);
  }

  double getTotal() {
    return items.fold(
        0, (double previousValue, item) => previousValue + item.cant * item.price);
  }

  Item? _find(String code) =>
      items.firstWhereOrNull((item) => item.code == code);
}
