import 'dart:convert';

import 'package:app/model/login_res.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Naulo extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  funn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var resp =
    await http.post(Uri.parse("http://192.168.1.172:8000/auth/login/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            "email": emailController.text,
            "password": passwordController.text
          },
        ));
    var x = loginResFromJson(resp.body);
    var access = x.tokens.access;
    var refresh = x.tokens.refresh;
    await pref.setString("access_token", access);
    await pref.setString("refresh_token", refresh);
    var a = pref.getString("access_token");
    print(a);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
            ),
            TextFormField(
              controller: passwordController,
            ),
            InkWell(
                onTap: () {
                  funn();
                },
                child: Text("click here")),
          ],
        ),
      ),
    ));
  }
}
