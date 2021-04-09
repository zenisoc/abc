import 'package:app/controller/mon_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Mon extends StatelessWidget {
  MonController _monController = Get.put(MonController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Obx(
            () {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _monController.emailController,
                      ),
                      TextFormField(
                        controller: _monController.passwordController,
                      ),
                      InkWell(
                          onTap: () async {
                            await _monController.fun(context);
                          },
                          child: _monController.isloading.value == true
                              ? CircularProgressIndicator()
                              : Text("submit")),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
