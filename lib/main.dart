

import 'package:app/repository/remote_services.dart';
import 'package:app/screen/complex.dart';
import 'package:app/screen/deal.dart';
import 'package:app/screen/developer.dart';
import 'package:app/screen/explore.dart';
import 'package:app/screen/home.dart';
import 'package:app/screen/login.dart';
import 'package:app/screen/mon.dart';
import 'package:app/screen/myHomePage.dart';
import 'package:app/screen/naulo.dart';
import 'package:app/screen/naya.dart';
import 'package:app/screen/picart.dart';
import 'package:app/screen/simple.dart';
import 'package:app/screen/solo.dart';
import 'package:app/screen/tue.dart';
import 'package:app/screen/wed.dart';
import 'package:flutter/material.dart';

import 'screen/sun.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login());
  }
}
