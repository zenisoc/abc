import 'dart:convert';
import 'dart:io';

import 'package:app/model/login_data.dart';
import 'package:app/screen/displayProfile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends StatelessWidget {
  // LoginController loginController = LoginController();
  static const BASE_URL = "http://192.168.1.172:8000/";
  post(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var resp =
    await http.post(Uri.parse("http://192.168.1.172:8000/auth/login/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            "email": "sagarkc8032@gmail.com",
            "password": "bhairahawa1",
          },
        ));
    print(resp.body);
    print(resp.statusCode);
    var x = loginDataFromJson(resp.body);
    var access = x.tokens.access;
    var refresh = x.tokens.refresh;
    await pref.setString("access_token", access);
    await pref.setString("refresh_token", refresh);
    if (resp.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DisplayProfile()),
      );
    }
  }
  Future<http.Response> getBasicApi(String otherUrl) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var access = pref.getString("access_token");
    var url = BASE_URL + otherUrl;
    var response = await http.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $access",
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 401) {
      print("Access Token Expired");
      String refreshToken = await pref.getString("refresh_token");
      var newAccessToken = await http.post(
          Uri.parse("http://192.168.1.172:8000/auth/token/refresh/"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
              <String, String>{"refresh": refreshToken}
          ));
      var decodeInfo = jsonDecode(newAccessToken.body);
      pref.setString("access_token", decodeInfo["access"]);
      var updateAccessToken = pref.getString("access_token");
      var newResponse = await http.get(
        Uri.parse("http://192.168.1.172:8000/profile/"),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $updateAccessToken",
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return newResponse;
    }
    return response;
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
