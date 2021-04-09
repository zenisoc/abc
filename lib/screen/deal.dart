import 'package:app/controller/sun_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Deal extends StatelessWidget {
  SunController _sunController = Get.put(SunController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
      return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_sunController.name.value),
              Text(_sunController.result.value, ),
              Text(_sunController.apple.value),
              Text(_sunController.name.value),
              Text(_sunController.ball.value),

              InkWell(
                onTap: (){
                  _sunController.result.value=(int.parse(_sunController.result.value)+100).toString();
                },
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.red,
                ),
              )

            ]

        );
      })

);
  }
}
