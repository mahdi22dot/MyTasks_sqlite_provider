import 'package:flutter/material.dart';
import 'package:mytasks_sqlite_provider/database_helper/dbHelper.dart';

class Task extends ChangeNotifier {
  String taskName;
  bool isComplete;
  Task([this.taskName, this.isComplete]);

  setTaskName(String taskName) {
    this.taskName = taskName;
    notifyListeners();
  }

  setIsComplete(bool isComplete) {
    this.isComplete = isComplete;
    notifyListeners();
  }

  toJson() {
    return {
      DBHelper.tasknamecol: this.taskName,
      DBHelper.taskiscompletecol: this.isComplete ? 1 : 0
    };
  }

  Task.fromJson(Map map) {
    this.taskName = map[DBHelper.tasknamecol];
    this.isComplete = map[DBHelper.taskiscompletecol] == 1 ? true : false;
  }
}
