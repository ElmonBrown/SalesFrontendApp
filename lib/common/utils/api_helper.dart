import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiHelper {
  Uri _apiUri = Uri();
  Map<String, String> _headers = {};


  ApiHelper({
    required String apiURL,
    String token =''
  }){
    _apiUri = Uri.parse(apiURL);
    _headers = <String, String>{
      HttpHeaders.authorizationHeader: 'Bearer ' + token,
      HttpHeaders.contentTypeHeader: 'application/json',
    };
  }


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

  Future<dynamic> post(String requestPath, {Map<String, dynamic>? body}) async {
    http.Response? response;
    try{
      response = await http.post(_apiUri.replace(path: requestPath),
          headers: _headers,
          body: jsonEncode(body));
    } on SocketException{
      print('Connection Error');
    }


    if (response == null) {
      print('connection error');
      return null;
    } else {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      return response;
    }
  }

  Future<dynamic> put(String requestPath, {Map<String, dynamic>? body}) async {
    http.Response? response;
    try{
      response = await http.put(_apiUri.replace(path: requestPath),
          headers: _headers,
          body: jsonEncode(body));
    } on SocketException{
      print('Connection Error');
    }


    if (response == null) {
      print('connection error');
      return null;
    } else {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      return response;
    }
  }

  Future<dynamic> delete(String requestPath, {Map<String, dynamic>? body}) async {
    http.Response? response;
    try{
      response = await http.delete(_apiUri.replace(path: requestPath),
          headers: _headers,
          body: jsonEncode(body));
    } on SocketException{
      print('Connection Error');
    }


    if (response == null) {
      print('connection error');
      return null;
    } else {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      return response;
    }
  }
}
