import 'dart:convert';

import 'package:multiquimica_store_app/common/utils/api_helper.dart';
import 'package:multiquimica_store_app/modules/shopping_cart/models/item.dart';
import 'package:multiquimica_store_app/settings/app_connections.dart';

class ShoppingCartService{
  ApiHelper _helper = ApiHelper(apiURL: AppConnections.apiBaseUrl, token: AppConnections.token);

  Future<List<Item>> getCarItems() async {
    var response = await _helper.get(AppConnections.sShoppingCarGetAll);
    if (response?.statusCode == 200) {
      var json = jsonDecode(response.body.toString());
      return List.generate(json["items"].length, (i) {
        return Item.fromMap(json["items"][i]);
      });
    } else
      return [];
  }

  Future<bool> addItem(String code, String presentationId, int cant) async {
    var response = await _helper.post(AppConnections.sShoppingCarAddItem,
        body: <String, dynamic>
        {
          "CatalogoCode": code,
          "PresentationCode": presentationId,
          "Quantity": cant
        } );
    return response?.statusCode == 200;
  }

  Future<bool> updateItem(String id, int cant) async {
    var response = await _helper.put(AppConnections.sShoppingCarUpdateItem,
    body: <String, dynamic>
    {
      "ItemId": id,
      "Quantity": cant
    } );
    return response?.statusCode == 200;
  }

  Future<bool> removeItem(String id) async {
    var response = await _helper.delete(AppConnections.sShoppingCarRemoveItem + id,);
    return response?.statusCode == 200;
  }

  Future<bool> quote() async {
    var response = await _helper.post(AppConnections.sShoppingCarQuotation,);
    return response?.statusCode == 200;
  }
}