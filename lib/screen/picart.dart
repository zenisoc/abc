import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:app/model/user_model_pic.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PicArt extends StatelessWidget {
  Future<List<PicArts>> getPic() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    var jsonResponse = await http.get(url);
    var data  = picArtsFromJson(jsonResponse.body);
    return data;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
        future: getPic(),
           builder:
               (context, snapshot) {
                if (snapshot.hasData) {
             return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Container(
                width: 300,
                height: 500,
                child: Column(
                  children: [

                    Text(snapshot.data[index].title.toString(),style: TextStyle( color: Colors.blue),),
                    Text(snapshot.data[index].albumId.toString()),
                    Text(snapshot.data[index].url.toString()),
                    Image.network(snapshot.data[index].thumbnailUrl.toString()),
                    Container(
                      height: 29,
                      width: 20,
                      color: Colors.lightBlue,
                     child: Text(snapshot.data[index].id.toString()),

                    )
                  ],
                ),
              );
            }
        );
      }
      return Container(
        child: Center(child: Text("monk")),
      );
    }
    ));

}}

