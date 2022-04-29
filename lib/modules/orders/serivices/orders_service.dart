import 'dart:convert';

import 'package:multiquimica_store_app/common/utils/api_helper.dart';
import 'package:multiquimica_store_app/modules/orders/models/order.dart';
import 'package:multiquimica_store_app/settings/app_connections.dart';

class OrdersService {
  ApiHelper _helper = ApiHelper(apiURL: AppConnections.apiBaseUrl, token: AppConnections.token);

  Future<List<Order>?> getOrders() async {
    var response = await _helper.get(AppConnections.sOrderGetAll);
    if (response?.statusCode == 200) {
      var json = jsonDecode(response.body.toString());
      return List.generate(json.length, (i) {
        return Order.fromMap(json[i]);
      });
    } else
      return null;
  }

  Future<Order?> getOrderDetail(String code) async {
    var response = await _helper.get(AppConnections.sOrderGetDetail + code);
    if (response?.statusCode == 200) {
      var json = jsonDecode(response.body.toString());
      return Order.fromMap(json);
    } else
      return null;
  }
}