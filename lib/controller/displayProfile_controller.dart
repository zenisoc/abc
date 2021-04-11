import 'package:app/model/profile_data.dart';
import 'package:app/repository/local_services.dart';
import 'package:app/screen/displayProfile.dart';
import 'package:flutter/material.dart';

class DisplayProfileController extends StatelessWidget {
  LocalServices localServices = LocalServices();

Future<List<ProfileData>>displayProfiles() async{
  var response = await localServices.getBasicApi("profile/");
  return  profileDataFromJson(response.body);
}
  Stream displayProfileStream() async*{
    while (true){
      yield await Future.delayed(Duration(seconds:4), (){
        return displayProfiles();
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
