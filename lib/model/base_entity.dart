import 'package:floor/floor.dart';

class BaseEntity {
  BaseEntity(this.id, this.created);

  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String created;
}