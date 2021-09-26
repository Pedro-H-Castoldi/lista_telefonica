// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorDataBaseApp {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DataBaseAppBuilder databaseBuilder(String name) =>
      _$DataBaseAppBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DataBaseAppBuilder inMemoryDatabaseBuilder() =>
      _$DataBaseAppBuilder(null);
}

class _$DataBaseAppBuilder {
  _$DataBaseAppBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$DataBaseAppBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$DataBaseAppBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<DataBaseApp> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$DataBaseApp();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$DataBaseApp extends DataBaseApp {
  _$DataBaseApp([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TaskRepositoryDAO? _taskRepositoryDAOInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Task` (`name` TEXT NOT NULL, `phone` TEXT NOT NULL, `address` TEXT NOT NULL, `id` INTEGER PRIMARY KEY AUTOINCREMENT, `created` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TaskRepositoryDAO get taskRepositoryDAO {
    return _taskRepositoryDAOInstance ??=
        _$TaskRepositoryDAO(database, changeListener);
  }
}

class _$TaskRepositoryDAO extends TaskRepositoryDAO {
  _$TaskRepositoryDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _taskInsertionAdapter = InsertionAdapter(
            database,
            'Task',
            (Task item) => <String, Object?>{
                  'name': item.name,
                  'phone': item.phone,
                  'address': item.address,
                  'id': item.id,
                  'created': item.created
                }),
        _taskUpdateAdapter = UpdateAdapter(
            database,
            'Task',
            ['id'],
            (Task item) => <String, Object?>{
                  'name': item.name,
                  'phone': item.phone,
                  'address': item.address,
                  'id': item.id,
                  'created': item.created
                }),
        _taskDeletionAdapter = DeletionAdapter(
            database,
            'Task',
            ['id'],
            (Task item) => <String, Object?>{
                  'name': item.name,
                  'phone': item.phone,
                  'address': item.address,
                  'id': item.id,
                  'created': item.created
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Task> _taskInsertionAdapter;

  final UpdateAdapter<Task> _taskUpdateAdapter;

  final DeletionAdapter<Task> _taskDeletionAdapter;

  @override
  Future<Task?> getById(int id) async {
    return _queryAdapter.query('SELECT * FROM Task WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Task(
            id: row['id'] as int?,
            created: row['created'] as String,
            name: row['name'] as String,
            phone: row['phone'] as String,
            address: row['address'] as String),
        arguments: [id]);
  }

  @override
  Future<List<Task>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM Task',
        mapper: (Map<String, Object?> row) => Task(
            id: row['id'] as int?,
            created: row['created'] as String,
            name: row['name'] as String,
            phone: row['phone'] as String,
            address: row['address'] as String));
  }

  @override
  Future<int> insertItem(Task item) {
    return _taskInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateItem(Task item) {
    return _taskUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteItem(Task item) {
    return _taskDeletionAdapter.deleteAndReturnChangedRows(item);
  }
}
