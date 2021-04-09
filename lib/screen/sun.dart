import 'package:app/controller/mon_controller.dart';
import 'package:app/controller/sun_controller.dart';
import 'package:app/screen/deal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Sun extends StatelessWidget {
  final TextEditingController one = TextEditingController();
  final TextEditingController two = TextEditingController();
  MonController _monController = Get.put(MonController());
  var count = 0.obs;
  void increment() {
    count++;
  }
  SunController _sunController = Get.put(SunController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Snackbar",
      home: Scaffold(
        appBar: AppBar(
          title: Text("snackbar"),
        ),
        body: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: one,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
              ),
              TextFormField(
                controller: two,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
              ),
              InkWell(
                  onTap: () {
                    int sum = int.parse(one.text) + int.parse(two.text);
                    var ans = sum.toString();
                    print(ans);
                    _sunController.result.value = ans;
                    _sunController.fun();
                    Get.to(Deal());
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => Deal()));
                  },
                  child: Text("add")),
              SizedBox(
                height: 200,
              ),
              Text(_sunController.apple.value),
              Text(_sunController.name.value),
              Text(  _sunController.ball.value),
              InkWell(
                child: Container(
                    width: 80,
                    height: 20,
                    color: Colors.red,
                    child: Text("show snacks")),
                onTap: () {
                  Get.snackbar(" title  ", "this is snacks",
                      isDismissible: true,
                      dismissDirection: SnackDismissDirection.HORIZONTAL,
                      forwardAnimationCurve: Curves.bounceInOut, onTap: (val) {
                    print("clicked");
                  });
                },
              ),
              InkWell(
                  onTap: () {
                    increment();
                  },
                  child: Text("click")),
              Center(
                child: InkWell(
                  child: Container(
                      width: 80,
                      height: 20,
                      color: Colors.lightBlue,
                      child: Text("show snacks")),
                  onTap: () {
                    Get.snackbar(" title  ", "this is snacks",
                        isDismissible: true,
                        dismissDirection: SnackDismissDirection.HORIZONTAL,
                        forwardAnimationCurve: Curves.bounceInOut,
                        onTap: (val) {
                      print("clicked");
                    });
                  },
                ),
              ),
              Text("$count"),
            ],
          );
        }),
      ),
    );
  }
}
