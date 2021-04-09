import 'package:flutter/material.dart';

class Tue extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: Center(child: Text("oc o clock"))
        ),
        body: StreamBuilder(
          initialData: "Working..",
          stream: _someData(),
          builder: (context, snapshot) {
            return Column(

              children: [
                SizedBox(
                  height: 100,
                ),
                Center(child: Text(snapshot.data.toString(),style: TextStyle(fontSize: 40),)),
                SizedBox(
                  height: 200,
                ),
                InkWell(
                  onTap: (){
                    
                  },
                    child: Text("RE"),),
              ],
            );
            // return Scaffold(
            //   bottomNavigationBar: Text(snapshot.data.toString()),
            //   floatingActionButton: IconButton(
            //       icon: Icon(Icons.ac_unit),
            //       onPressed: () {
            //         print(snapshot.data.toString());
            //       }),
            // );
          }
        ),
      ),
    );
  }
}

 Stream<int> _someData()async* {
  yield* Stream.periodic(Duration(seconds: 1), (int a){
    return a++;
  });
 }