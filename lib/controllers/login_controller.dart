import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


//
login(String email, String password) async {

  const String baseUrl = 'http://10.0.2.2:8000/api/login';
    //const String baseUrl = 'http://localhost:8000/api/login'; //WEB

  var client = http.Client();
  var url = Uri.parse(baseUrl);
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'cache-control': 'no-cache',
  };

  var body = json.encode({
    'email': email,
    'password': password,
  });

  http.Response response = await client.post(url, headers: headers, body: body);
  debugPrint("STATUS CODE: \${response.statusCode}");
  debugPrint("RESPONSE BODY: \${response.body}");

  if (response.statusCode == 200) {
    var message = json.decode(response.body);

    if (message.containsKey('access_token') && message['access_token'] != null) {
      saveToken(message['access_token']);
      return 200;
    } else {
      debugPrint("Error: El token de acceso no se encontró en la respuesta.");
      return 300;
    }
  } else {
    return 300;
  }
}

saveToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('token_app', token);
}
