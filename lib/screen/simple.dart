import 'dart:convert';
import 'package:app/model/login_res.dart';
import 'package:app/screen/complex.dart';
import 'package:app/screen/explore.dart';
import 'package:app/screen/wed.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class Simple extends StatefulWidget {
  @override
  _SimpleState createState() => _SimpleState();
}
class _SimpleState extends State<Simple> {
  var isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  fun(context) async {
    setState(() {
      isLoading = true;
    });
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
    print(resp.body);
    print(resp.statusCode);
    var x = loginResFromJson(resp.body);
    print(x);
    var access = x.tokens.access;
    var refresh = x.tokens.refresh;
    await pref.setString("access_token", access);
    await pref.setString("refresh_token", refresh);
    var a = pref.getString("access_token");
    if (resp.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Complex()),
      );
    }
    // setState(() {
    //   isLoading = false;
    // });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
            ),
            TextFormField(
              controller: passwordController,
            ),
            SizedBox(height: 25),
            InkWell(
                onTap: () async {
                  await fun(context);
                },
                child: isLoading == true
                    ? CircularProgressIndicator()
                    : Text("submit")),
          ],
        ),
      ),
    ));
  }
}
