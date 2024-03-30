// import 'package:empower_app/main.dart';
// import 'package:empower_app/rutes.dart';
import 'package:ingresos_egresos/rutes.dart';
// import 'package:empower_app/src/screens/empleate/empleate.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SizedBox(height: MediaQuery.of(context).size.height * 0.02);
    return const Scaffold(
        body: Center(
      child: Center(
        child: Text('Home'),
      ),
    ));
  }
}
