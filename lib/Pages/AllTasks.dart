import 'package:flutter/cupertino.dart';
import 'package:mytasks_sqlite_provider/Tasks_opperations/task_widget.dart';
import 'package:mytasks_sqlite_provider/conistant/constant.dart';
import 'package:provider/provider.dart';

class AllTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
          children: Provider.of<AppProvider>(context)
              .tasks
              .map((e) => TaskWidget(e))
              .toList()),
    );
  }
}
