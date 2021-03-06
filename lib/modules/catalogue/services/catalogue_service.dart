import 'dart:convert';

import 'package:multiquimica_store_app/common/utils/api_helper.dart';
import 'package:multiquimica_store_app/modules/catalogue/models/category.dart';
import 'package:multiquimica_store_app/modules/catalogue/models/product.dart';
import 'package:multiquimica_store_app/settings/app_connections.dart';

class CatalogueService {
  ApiHelper _helper = ApiHelper(apiURL: AppConnections.apiBaseUrl, token: AppConnections.token);

  Future<List<Category>> getCategories() async {
    var response = await _helper.get(AppConnections.sCategoriesList);
    if (response?.statusCode == 200) {
      var json = jsonDecode(response.body.toString());
      return List.generate(json.length, (i) {
        return Category.fromMap(json[i]);
      });
    } else
      return [];
  }

  Future<List<Product>> getProducts(String idCategory) async {
    var response = await _helper.get(AppConnections.sCatalogueList + idCategory);
    if (response?.statusCode == 200) {
      var json = jsonDecode(response.body.toString());
      return List.generate(json.length, (i) {
        return Product.fromMap(json[i]);
      });
    } else
      return [];
  }

  Future<Product?> getProductDetail(String code) async {
    var response = await _helper.get(AppConnections.SCatalogueDetail + code);
    if (response?.statusCode == 200) {
      var json = jsonDecode(response.body.toString());
      return Product.fromMap(json);
    } else
      return null;
  }
}
