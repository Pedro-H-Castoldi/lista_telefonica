import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_telefonica/screens/tasks_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return TasksPage();
            },
          ),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Lista de Contatos"),
      ),
    );
  }

}