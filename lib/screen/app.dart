import 'dart:convert';

import 'package:app/model/user_model.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class App extends StatelessWidget {

  Future<List<String>> getData() async {
    var url = Uri.parse("https://thegrowingdeveloper.org/apiview?id=4");
    var jsonResponse = await http.get(url);
    var data = dummyFromJson(jsonResponse.body);
    return data;

  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      // ignore: missing_return
      builder: (context, snapshot){
        if(snapshot.hasData){
          print(snapshot.data);
          return Container(
              height:20,
              width:20,
              child: Text(snapshot.data.toString()));
        }
      }

    );
  }
}
