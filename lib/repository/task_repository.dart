import 'package:floor/floor.dart';
import 'package:lista_telefonica/model/task.dart';
import 'package:lista_telefonica/repository/irepository.dart';

@dao
abstract class TaskRepositoryDAO extends IRepositoryDAO<Task> {
  @Query('SELECT * FROM Task WHERE id = :id')
  Future<Task?> getById(int id);

  @Query('SELECT * FROM Task')
  Future<List<Task>> getAll();
}
