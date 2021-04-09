import 'package:app/model/profile_data.dart';
import 'package:app/repository/local_services.dart';
import 'package:flutter/material.dart';

class DisplayProfileController extends StatelessWidget {
  LocalServices localServices = LocalServices();

Future<List<ProfileData>>displayProfiles() async{
  var response = await localServices.getBasicApi("profile/");
  return  profileDataFromJson(response.body);
}
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
