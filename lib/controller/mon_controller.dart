import 'dart:convert';

import 'package:app/screen/profile.dart';
import 'package:http/http.dart';
import 'package:app/model/login_res.dart';
import 'package:app/screen/complex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class MonController extends GetxController{
  var isloading = false.obs;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  fun(context) async {
    isloading.value = true;
    SharedPreferences pref = await SharedPreferences.getInstance();
    var resp =
    await http.post(Uri.parse("http://192.168.1.172:8000/auth/login/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            "email": emailController.text,
            "password": passwordController.text,
          },
        ));
    print(resp.body);
    print(resp.statusCode);
    var x = loginResFromJson(resp.body);
    print(x);
    var access = x.tokens.access;
    var refresh = x.tokens.refresh;
    await pref.setString("access_token", access);
    await pref.setString("refresh_token", refresh);
    var a = pref.getString("access_token");
    isloading.value = false;
    if (resp.statusCode == 200) {
      Get.to(Profile());
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => Complex()),
      // );
    }
    // setState(() {
    //   isLoading = false;
    // });
  }

}