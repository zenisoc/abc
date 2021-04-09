import 'package:app/controller/displayProfile_controller.dart';
import 'package:app/repository/local_services.dart';
import 'package:flutter/material.dart';

class DisplayProfile extends StatelessWidget {
 DisplayProfileController displayProfileController = DisplayProfileController();

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

                    },
                    child: Text("TOKEN")),
              ),
              SizedBox(height: 30),
              Expanded(
                child: FutureBuilder(
                    future: displayProfileController.displayProfiles(),
                    builder: (context,snapshot){
                      print("sjjs");
                      print(snapshot.data);
                      if(snapshot.hasData){
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
                      else return Container(
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
