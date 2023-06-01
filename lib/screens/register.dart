import 'package:flutter/material.dart';
import 'package:todolist/model/usermanager.dart';
import 'package:todolist/screens/myhomepage.dart';

import '../model/user.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => RegisterState();
}

class RegisterState extends State<RegisterPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordRepeatController = TextEditingController();
  String txt = "Rejestracja";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.app_registration_rounded, size: 80),
        Text(
          txt,
          style: TextStyle(fontSize: 30),
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
              controller: nameController,
              decoration: InputDecoration(
                  labelText: "Imię", border: OutlineInputBorder())),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Hasło", border: OutlineInputBorder())),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
              controller: passwordRepeatController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Powtórz hasło", border: OutlineInputBorder())),
        ), //pole hasło
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    if (passwordController.text ==
                        passwordRepeatController.text) {
                      addUser(nameController.text, loginController.text,
                          passwordController.text);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Pomyślnie zarejestrowano"),
                        duration: Duration(seconds: 2),
                      ));
                      //Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Coś poszło nie tak"),
                        duration: Duration(seconds: 2),
                      ));
                    }
                  },
                  child: Text("Rejestruj"))),
        ),
      ],
    ));
  }

  void addUser(String name, String login, String password) {
    setState(() {
      UserManager.users.add(User(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          login: login,
          name: name,
          password: password));
    });
    txt = "aaaa";
    loginController.clear();
    nameController.clear();
    passwordController.clear();
    passwordRepeatController.clear();
  }
}
