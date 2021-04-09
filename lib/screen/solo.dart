import 'dart:convert';
import 'dart:io';
import 'package:app/model/login_res.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Solo extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  info() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var resp = await http.post(
      Uri.parse("http://192.168.1.172:8000/auth/login/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          "email": emailController.text,
          "password": passwordController.text
        },
      ),
    );
    print(resp.body);
    var x = loginResFromJson(resp.body);
    var access = x.tokens.access;
    var refresh = x.tokens.refresh;
    await pref.setString("access_token", access);
    await pref.setString("refresh_token", refresh);
    var a = pref.getString("access_token");
    print(a);
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
                  info();

                },
                child: Text("submit")),

          ],
        ),
      ),
    ));
  }
}
