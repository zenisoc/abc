import 'dart:convert';
import 'dart:io';
import 'package:app/model/maha.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class Complex extends StatelessWidget {
  Future<List> getData() async{
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: InkWell(
                  onTap: () {
                    den();
                  },
                  child: Text("TOKEN")),
            ),
           SizedBox(height: 30),
            Expanded(
              child: FutureBuilder(
                future: den(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    print("ghghghghgh");
                    print(snapshot.data);
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context,index){
                        return Container(
                          width: 200,
                          height: 200,
                          child: Column(
                            children: [
                              Text(snapshot.data[index].profileId.toString()),
                              Text(snapshot.data[index].gender.toString()),
                              Text(snapshot.data[index].community.toString()),
                              Text(snapshot.data[index].country.toString()),

                              Container(
                                color: Colors.red,
                                  child: Text(snapshot.data[index].profileImage.toString())),
                            ],
                          )
                        );
                      },
                    );
                  }
                  return Container(
                    child: Text("monk"),
                  );
                }
              ),
            ),
          ]
        ),
      ),
    );
  }
}
