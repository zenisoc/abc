import 'package:app/model/user_model_one.dart';
import 'package:flutter/material.dart';
import 'package:app/model/user_model.dart';
import 'package:http/http.dart' as http;


class Developer extends StatelessWidget {
  Future<List> getDev() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var jsonResponse = await http.get(url);
    var data = dangFromJson(jsonResponse.body);
    return data;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getDev(),
          // ignore: missing_return
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200,
                      height: 200,
                      child: Column(
                        children: [
                          Text(snapshot.data[index].title.toString()),
                        ],
                      ),
                    );
                  }
              );
            }
            return Container(
              child: Text("monk"),
            );
          }),
    );
}
}