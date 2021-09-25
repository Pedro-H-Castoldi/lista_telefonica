import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_telefonica/database/database.dart';
import 'package:lista_telefonica/model/task.dart';
import 'package:lista_telefonica/screens/tasks_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.db}) : super(key: key);
  final DataBaseApp db;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return TasksPage(db: widget.db);
            },
          ),
          );
          if(result) {
            setState(() {});
          }
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Lista de Contatos"),
      ),
      body: FutureBuilder<List<Task>>(
        future: widget.db.taskRepositoryDAO.getAll(),
        builder: (context, snapshot) {
          return snapshot.hasData ?
              ListView.builder(
                itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data![index].name),
                      subtitle:
                        Text(snapshot.data![index].phone.toString()),
                      leading: Text(snapshot.data![index].address),
                    ),
                  );
                  },
              )
              : Center(
            child: Text("Sem contatos cadastrados."),
          );
        },
      )
    );
  }
}