import 'dart:convert';

import 'package:multiquimica_store_app/common/utils/api_helper.dart';
import 'package:multiquimica_store_app/settings/app_connections.dart';

class CatalogueService {
  ApiHelper _helper = ApiHelper(apiURL: AppConnections.apiBaseUrl, token: AppConnections.token);

  Future<List<dynamic>> getOrders() async {
    var response = await _helper.get(AppConnections.sOrderGetRange);
    if (response?.statusCode == 200) {
      var json = jsonDecode(response.body.toString());
      return List.generate(json.length, (i) {
        //return Category.fromMap(json[i]);
      });
    } else
      return [];
  }

  Future<dynamic> getOrderDetail(String code) async {
    var response = await _helper.get(AppConnections.sOrderGetDetail + code);
    if (response?.statusCode == 200) {
      var json = jsonDecode(response.body.toString());
      //return Product.fromMap(json);
    } else
      return null;
  }
}