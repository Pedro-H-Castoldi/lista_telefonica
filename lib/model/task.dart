import 'package:floor/floor.dart';
import 'package:lista_telefonica/model/base_entity.dart';

@entity
class Task extends BaseEntity {
  Task({
    int? id,
    required String created,
    required this.name,
    required this.phone,
    required this.address,
  }): super(id, created);

  final String name;
  final int phone;
  final String address;

}