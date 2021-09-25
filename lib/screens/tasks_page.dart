import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
        child: Icon(Icons.save),
      ),

      appBar: AppBar(
        title: Text("Adicione um Contato"),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget> [
          IconButton (
            icon: Icon(Icons.delete),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column (
          children: <Widget> [
            new TextField (
              decoration:
                  InputDecoration(
                    label: Text("Nome:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
              maxLength: 50,
            ),
            new TextField (
              decoration:
              InputDecoration(
                  label: Text("Número de Contato:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              maxLength: 50,
            ),

            new TextField (
              decoration:
              InputDecoration(
                  hintText: "Escreva o Endereço:",
              ),
              maxLines: 5,
            )
          ],
        )
      ),
    );
  }

}