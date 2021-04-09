  import 'dart:convert';
import 'package:app/model/info.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Naya extends StatelessWidget {

  Future<List> getData() async {
    var url = Uri.parse(
        "https://jsonplaceholder.typicode.com/posts/1/comments");
    var jsonResponse = await http.get(url);
    var data = infoFromJson(jsonResponse.body);
    print(jsonResponse.statusCode);
    if(jsonResponse.statusCode==200){
      print("hahahaha");
      print("you are nandi");
    }
    return data;
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          title: Text("Zenish Code"),
        ),
        backgroundColor: Colors.cyan,
        body: FutureBuilder(
          future: getData(),
          builder: (context , snapshot){
            if(snapshot.hasData){
              print(snapshot.data);
              return ListView.builder(
                itemCount:snapshot.data.length,
                itemBuilder: (context, index){
                  return SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white)
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Text(snapshot.data[index].name,style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                          SizedBox(
                            height: 10,
                          ),
                          Text(snapshot.data[index].body,style: TextStyle(color: Colors.white),),

                        ],
                      ),
                    ),
                  );
                },
              );
            }
            else return Container();
          }
        ),
      );
    }
  }
