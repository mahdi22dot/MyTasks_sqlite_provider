import 'package:mytasks_sqlite_provider/Tasks_opperations/task_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  DBHelper._();
  static DBHelper dbHelper = DBHelper._();
  static final String tasksdatabase = 'tasksDB.db';
  static final String taskstable = 'tasks';
  static final String taskidcol = 'id';
  static final String tasknamecol = 'name';
  static final String taskiscompletecol = 'isComplete';
  Database database;
  Future<Database> initDatabase() async {
    if (database == null) {
      return await createDatabase();
    } else {
      return database;
    }
  }

  // ignore: missing_return
  Future<Database> createDatabase() async {
    try {
      var databasePath = await getDatabasesPath();
      String path = join(databasePath, tasksdatabase);
      database = await openDatabase(path, version: 1, onCreate: (db, version) {
        db.execute('''CREATE TABLE $taskstable(
            $taskidcol INTEGER PRIMARY KEY AUTOINCREMENT,
            $tasknamecol TEXT NOT NULL,
            $taskiscompletecol INTEGER
          )''');
      });
      return database;
    } on Exception catch (e) {
      print(e);
    }
  }

  insertNewTask(Task task) async {
    try {
      database = await initDatabase();
      int x = await database.insert(taskstable, task.toJson());
      print(x);
    } on Exception catch (e) {
      print(e);
    }
  }
/*
  // ignore: missing_return
  Future<List<Map>> getAllTasks() async {
    try {
      database = await initDatabase();
      List<Map> result = await database.query(taskstable);
      fethcData(result);
    } on Exception catch (e) {
      print(e);
    }
  }
  */

  // ignore: missing_return
  Future<List<Task>> getAllTasks() async {
    try {
      database = await initDatabase();
      List<Map> result = await database.query(taskstable);
      List<Task> tasks = result.map((e) => Task.fromJson(e)).toList();
      return tasks;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  

  deleteTask(String taskName) async {
    try {
      database = await initDatabase();
      int x = await database
          .delete(taskstable, where: '$tasknamecol=?', whereArgs: [taskName]);
      print(x);
    } on Exception catch (e) {
      print(e);
    }
  }

  updateTask(Task task) async {
    try {
      database = await initDatabase();
      int x = await database.update(taskstable, task.toJson(),
          where: '$tasknamecol=?', whereArgs: [task.taskName]);
      print(x);
    } on Exception catch (e) {
      print(e);
    }
  }

  /*fethcData(List<Map> result) {
    String taskName;
    bool isComplete;
    for (int i = 0; i < result.length; i++) {
      var entryList = result[i].entries.toList();
      for (int j = 0; j < entryList.length; j++) {
        if (entryList[j].key == 'name') {
          taskName = (entryList[j].value);
        }

        if (entryList[j].key == 'isComplete') {
          if (entryList[j].value == 1) {
            isComplete = true;
          } else {
            isComplete = false;
          }
        }
      }
      tasks.add(Task(taskName, isComplete));
    }
  }*/
}
