import 'dart:convert';
import 'dart:io';

import 'package:app/model/maha.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  Future<List> getData() async {
    var url = Uri.parse("http://192.168.1.172:8000/profile/");
    var jsonResponse = await http.get(url);
    var data = mahaFromJson(jsonResponse.body);
    return data;
  }
  den() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var access = pref.getString("access_token");
    var response = await http.get(
      Uri.parse("http://192.168.1.172:8000/profile/"),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $access",
        'Content-Type': 'application/json; charset=UTF-8',
      },
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
          body: jsonEncode(<String, String>{"refresh": refreshToken}));
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
    var x = mahaFromJson(response.body);
    return x;
  }
}
