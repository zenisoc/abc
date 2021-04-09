import 'package:app/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  ProfileController _profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body:Column(
          children: [
            FutureBuilder(
                future: _profileController.den(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    print("ghghghghgh");

                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context,index){
                          return Container(
                              child: Column(
                                children: [
                                  Text(snapshot.data[index].profileId.toString()),
                                  Text(snapshot.data[index].gender.toString()),
                                  Text(snapshot.data[index].community.toString()),
                                  Text(snapshot.data[index].country.toString()),
                                  Container(
                                      color: Colors.red,
                                      child: Image.network(snapshot.data[index].profileImage.toString()))
                                ],
                              )
                          );
                        },
                      ),
                    );
                  }
                  return Container(
                    child: Text("monk"),
                  );
                }
            ),
          ],
        )

    ));

  }
}
