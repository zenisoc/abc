import 'package:app/repository/remote_services.dart';
import 'package:flutter/material.dart';

class Wed extends StatelessWidget {
  RemoteServices remoteServices = RemoteServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: InkWell(
                onTap: () async {
                  remoteServices.den();
                },
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                  stream: remoteServices.den(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print("ghghghghgh");
                      print(snapshot.data);
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
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
                                      child: Text(snapshot
                                          .data[index].profileImage
                                          .toString())),
                                ],
                              ));
                        },
                      );
                    }
                    return Container(
                      child: Text("monk"),
                    );
                  }),
            )
          ]
        ),
      ),
    );
  }
}
