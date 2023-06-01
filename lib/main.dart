import 'package:flutter/material.dart';
import 'package:todolist/screens/myhomepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'TODO List',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
          primarySwatch: Colors.brown,
          scaffoldBackgroundColor: Colors.brown[100],
          textTheme:
              Theme.of(context).textTheme.apply(bodyColor: Colors.brown[900])),

      // A widget which will be started on application startup
      home: MyHomePage(),
    );
  }
}
