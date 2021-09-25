import 'dart:async';

import 'package:floor/floor.dart';
import 'package:lista_telefonica/model/task.dart';
import 'package:lista_telefonica/repository/task_repository.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Task])

abstract class DataBaseApp extends FloorDatabase {
  TaskRepositoryDAO get taskRepositoryDAO;
}