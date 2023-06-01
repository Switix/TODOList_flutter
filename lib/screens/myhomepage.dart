import 'package:flutter/material.dart';
import 'package:todolist/model/usermanager.dart';
import 'package:todolist/screens/register.dart';
import 'package:todolist/screens/todolistpage.dart';

import '../model/user.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.account_box_rounded,
          size: 80,
        ),
        Center(
          child: Text(
            "LOGOWANIE",
            style: TextStyle(fontSize: 30),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
              controller: loginController,
              decoration: InputDecoration(
                  labelText: "Login", border: OutlineInputBorder())),
        ), //pole login
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Hasło", border: OutlineInputBorder())),
        ), //pole hasło
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    User user = UserManager.findUser(
                        loginController.text, passwordController.text);
                    if (user.id == "") {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Błędne dane"),
                        duration: Duration(seconds: 2),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text("Zalogowano pomyślnie, Witaj ${user.name}"),
                        duration: Duration(seconds: 2),
                      ));
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TodoListPage(),
                      ));
                    }
                  },
                  child: Text("Zaloguj"))),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegisterPage(),
                    ));
                  },
                  child: Text("Rejestracja"))),
        ) //button Rejestracja
      ],
    ));
  }
}
