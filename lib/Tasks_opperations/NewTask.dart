import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytasks_sqlite_provider/Tasks_opperations/task_model.dart';
import 'package:mytasks_sqlite_provider/database_helper/dbHelper.dart';
import 'package:provider/provider.dart';

import '../splach.dart';

// ignore: must_be_immutable
class NewTask extends StatelessWidget {
  String taskName;
  bool isComplete;

  @override
  Widget build(BuildContext context) {
    taskName = Provider.of<Task>(context).taskName;
    isComplete = Provider.of<Task>(context).isComplete;
    if (isComplete == null) {
      isComplete = false;
    }
    return Scaffold(
      appBar: AppBar(title: Text('New Task')),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                onChanged: (value) {
                  Provider.of<Task>(context, listen: false).setTaskName(value);
                }),
            Checkbox(
                value: isComplete,
                onChanged: (value) {
                  Provider.of<Task>(context, listen: false)
                      .setIsComplete(value);
                }),
            RaisedButton(
                child: Text('Add New Task'),
                onPressed: () {
                  DBHelper.dbHelper
                      .insertNewTask(Task(this.taskName, this.isComplete));
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return SplachPage();
                  }));
                })
          ],
        ),
      ),
    );
  }
}
