import 'package:flutter/cupertino.dart';
import 'package:mytasks_sqlite_provider/Tasks_opperations/task_model.dart';

class AppProvider extends ChangeNotifier {
  List<Task> tasks = [];

  setTask(List<Task> tasks) {
    this.tasks = tasks;
  }

  getNotefier(){
    notifyListeners();
  }


}
