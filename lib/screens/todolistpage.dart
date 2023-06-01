import 'package:flutter/material.dart';

import '../model/usermanager.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<StatefulWidget> createState() => TodoListState();
}

class TodoListState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Witaj ${UserManager.loggedUser!.name}")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        child: Icon(Icons.add),
      ),
      body: ListView(children: [ToDoTile(), ToDoTile()]),
    );
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.brown[100],
            content: Container(
              height: 140,
              child: Column(children: [
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Wpisz Treść zadania"),
                ),
                ElevatedButton(onPressed: () {}, child: Text("Dodaj"))
              ]),
            ),
          );
        });
  }
}

class ToDoTile extends StatelessWidget {
  const ToDoTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Checkbox(value: false, onChanged: onChanged),
              Text(
                "Treść zadania",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.brown[600], borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  void onChanged(bool? value) {}
}
