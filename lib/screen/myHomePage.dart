import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
              ),
              TextField(
                controller: jobController,
              ),
              SizedBox(
                height: 30,
              ),
              FloatingActionButton(
                onPressed: null,
                child: Icon(Icons.ac_unit),
              )
            ],
          ),
        )),
      ),
    );
  }
}
