import 'dart:convert';
import 'dart:io';

import 'package:app/model/jodi.dart';
import 'package:app/model/maha.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RemoteServices extends StatelessWidget {
   var remote = RemoteServices();
  static const BASE_URL = "http://192.168.1.172:8000/";
  Future getData() async{
    var url = Uri.parse("http://192.168.1.172:8000/auth/login/");
    var jsonResponse = await http.get(url);
    var data = jodiFromJson(jsonResponse.body);
    return data;
  }
  post() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var url = BASE_URL + "auth/login/";
    var resp = await http.post(Uri.parse(url),
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
    var x = jodiFromJson(resp.body);
    print(x);
    var access = x.tokens.access;
    var refresh = x.tokens.refresh;
    await pref.setString("access_token", access);
    await pref.setString("refresh_token", refresh);
    var a = pref.getString("access_token");
    print(a);
  }
  den(  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var access = pref.getString("access_token");
    var response = await http.get(
      Uri.parse("http://192.168.1.172:8000/"),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $access",
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==401){
      print("Access Token Expired");
      String refreshToken = await pref.getString("refresh_token");
      var newAccessToken = await http.post(Uri.parse("http://192.168.1.172:8000/auth/token/refresh/"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
              <String, String>{"refresh": refreshToken}
          ));
      var decodeInfo = jsonDecode(newAccessToken.body);
      pref.setString("access_token",decodeInfo["access"]);
      var updateAccessToken =  pref.getString("access_token");
      var newResponse = await http.get(
        Uri.parse("http://192.168.1.172:8000/profile/"),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $updateAccessToken",
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return newResponse;
    }
    var x = mahaFromJson(response.body);
    return x;
  }


  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Scaffold(
      body:  InkWell(
        onTap: () async{
          post();
        },
        child: Container(
          color: Colors.red,

        ),
      ),
    ),
    );
  }
}
