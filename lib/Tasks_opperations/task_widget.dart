import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytasks_sqlite_provider/Tasks_opperations/task_model.dart';
import 'package:mytasks_sqlite_provider/conistant/constant.dart';
import 'package:mytasks_sqlite_provider/database_helper/dbHelper.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TaskWidget extends StatelessWidget {
  Task task;
  TaskWidget(this.task);
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showAlertDialog(context);
                  }),
              Text(task.taskName),
              Checkbox(
                  value: task.isComplete,
                  onChanged: (value) {
                    Provider.of<AppProvider>(context, listen: false)
                        .getNotefier();
                    this.task.isComplete = !this.task.isComplete;
                    DBHelper.dbHelper.updateTask(task);
                  })
            ],
          ),
        ));
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        Provider.of<AppProvider>(context, listen: false).getNotefier();
        Provider.of<AppProvider>(context, listen: false)
            .tasks
            .removeWhere((element) => task.taskName == element.taskName);
        DBHelper.dbHelper.deleteTask(task.taskName);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete"),
      content: Text("Would you like to continue this step?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
