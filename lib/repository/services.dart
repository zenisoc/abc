import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:app/model/maha.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Services extends StatelessWidget {
  static const BASE_URL = "http://192.168.1.172:8000/";
  Future<http.Response>basicGetApiCall(String otherUrl) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var accessToken =  await SharedPreferences.getInstance();
    var access = pref.getString("access_token");
    var url = BASE_URL + otherUrl ;
    try{
      var response = await http.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $accessToken",
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if(response.statusCode==401){
        print("Access Token Expired");
        String refreshToken = pref.getString("refresh_token");
        var url = BASE_URL + "auth/token/refresh/" ;
        var newAccessToken = await http.post(Uri.parse(url),
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
          Uri.parse(url),
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $updateAccessToken",
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );
        return newResponse;
      }
      print(response.statusCode);
      print(response.body);
    }
    catch (e) {
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
