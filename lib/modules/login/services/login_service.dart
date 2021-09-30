import 'dart:convert';

import 'package:multiquimica_store_app/common/utils/api_helper.dart';
import 'package:multiquimica_store_app/modules/login/models/login_model.dart';
import 'package:multiquimica_store_app/settings/app_connections.dart';

class LoginService {
  ApiHelper _helper = ApiHelper(apiURL: AppConnections.apiBaseUrl);

  Future<String?> signIn(String user, String password) async {
    var response = await _helper.post(AppConnections.sLoginSignIn,
        body: LoginModel(user: user, password: password)
            .toMap());
    if (response?.statusCode == 200) {
      var json = jsonDecode(response.body.toString());
      return json["token"];
    } else
      return null;
  }
}
