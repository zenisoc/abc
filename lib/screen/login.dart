import 'package:app/controller/login_controller.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  // RemoteServices remoteServices = RemoteServices();
  LoginController loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              loginController.post( context);
            },
            onDoubleTap: () {
              print("balls");
            },
            child: Text("login"),
          ),
        ],
      ),
    ));
  }
}
