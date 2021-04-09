import 'dart:convert';

import 'package:app/model/user_model_post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController nameController = TextEditingController();
  var isTapped = false;

  Future<UserModel> PostData() async {
    print("ehjoo");
    var url = Uri.parse("https://reqres.in/api/users");
    var jsonResponse = await http.post(url,
        body: jsonEncode({
          "name": nameController.text,
          "age": "21",
        }));
    var result = userModelFromJson(jsonResponse.body);
   return result;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          InkWell(
              onTap: ()  {
                setState(() {
                  isTapped = true;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: 400, height: 100, color: Colors.red),
              )),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
            ),
          ),
         isTapped == true ?  FutureBuilder(
             future: PostData(),
             builder: (context,snapshot) {
               if (snapshot.hasData) {
                 return Text(snapshot.data.id.toString());
               }
               else {
                 return CircularProgressIndicator();
               }
             }
         ):
             Container(

             ),

        ]),
      ),
    );
  }
}
