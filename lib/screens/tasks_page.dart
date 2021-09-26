import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_telefonica/database/database.dart';
import 'package:lista_telefonica/model/task.dart';

class TasksPage extends StatelessWidget {
  TasksPage({Key? key, required this.db}) : super(key: key);
  final DataBaseApp db;

  final _nameController = TextEditingController(text: '');
  final _phoneController = TextEditingController(text: '');
  final _adressController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            if(_nameController.text.isNotEmpty && _phoneController.text.isNotEmpty && _adressController.text.isNotEmpty) {
              db.taskRepositoryDAO.insertItem(Task(
                name: _nameController.text,
                phone: _phoneController.text,
                address: _adressController.text,
                created: DateTime.now().toUtc().toString(),
              ));
            }
            Navigator.pop(context, true);
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
              controller: _nameController,
              decoration:
                  InputDecoration(
                    label: Text("Nome:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
              maxLength: 50,
            ),
            new TextField (
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration:
              InputDecoration(
                  label: Text("Número de Contato:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              maxLength: 11,
            ),

            new TextField (
              controller: _adressController,
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