import 'package:app/controller/explore_controller.dart';
import 'package:app/model/maha.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Explore extends StatelessWidget {
  final ExploreController controller = Get.put(ExploreController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: StreamBuilder(
        initialData: null,
        stream: controller.getUserStream(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return PageView.builder(
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
        ,
      )

    ),);
  }
}
