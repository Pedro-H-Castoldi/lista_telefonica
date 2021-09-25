import 'package:flutter/material.dart';
import 'package:lista_telefonica/database/database.dart';
import 'package:lista_telefonica/screens/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    db: await $FloorDataBaseApp.
    databaseBuilder('app_database_ta.db').build(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.db}) : super(key: key);
  final DataBaseApp db;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',

      home: HomePage(db:db),
    );
  }
}

