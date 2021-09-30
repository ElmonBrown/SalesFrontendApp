import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiHelper {

  ApiHelper({
    required String apiURL,
  }){
    _apiUri = Uri.parse(apiURL);
  }
  String token ='';
  Uri _apiUri = Uri();
  Map<String, String> _headers = <String, String>{
    HttpHeaders.authorizationHeader: 'Bearer ' +'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InN5c2FkbWluIiwiZW1haWwiOiJzeXNhZG1pbkBhZG1pbi5jb20iLCJzdWIiOiJhMjgwZjU5Yy00NzI3LTQ4MGQtYTc3MS01NDliYjQ3YTZjZjYiLCJhdXRoX3RpbWUiOiI5LzMwLzIwMjEgNzowNzoyMCBQTSIsImp0aSI6IjIwZWViZWE3LWVkMzgtNGQ1NC04YmY1LWRmMDc0MWQ1Yjg2NyIsImV4cCI6MTYzMzExNTI0MCwiaXNzIjoiTVFETy5DT05ORUNULlNBTEUuQVBQIiwiYXVkIjoiTVFETy5DT05ORUNULlNBTEUuQVBQIn0.77bnhxhPfoIAenEeyGcyOzeDoQRnaYput7ccc2mkndU',
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  Future<dynamic> get(String requestPath) async {
    var response;
    try {
      response = await http.get(_apiUri.replace(path: requestPath),headers: _headers);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } on SocketException {
      print('Connection Error');
    }
    return response;
  }

  Future<dynamic> post(String requestPath, {required Map<String, dynamic> body}) async {
    http.Response? response;
    try{
      response = await http.post(_apiUri.replace(path: requestPath),
          headers: _headers,
          body: jsonEncode(body));
    } on SocketException{
      print('Connection Error');
    }


    if (response == null) {
      print('conection error');
      return null;
    } else {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      return response;
    }
  }
}
