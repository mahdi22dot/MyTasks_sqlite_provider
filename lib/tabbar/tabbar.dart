import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytasks_sqlite_provider/Pages/AllTasks.dart';
import 'package:mytasks_sqlite_provider/Pages/CompletedTasks.dart';
import 'package:mytasks_sqlite_provider/Pages/UncompletedTasks.dart';
import 'package:mytasks_sqlite_provider/Tasks_opperations/NewTask.dart';
class TapBar extends StatefulWidget {
  @override
  TapBarState createState() => TapBarState();
}

class TapBarState extends State<TapBar> with SingleTickerProviderStateMixin {
  TabController tabController;
  changeCheckBoxPlaces() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Tasks"),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(
              text: 'All Tasks',
            ),
            Tab(
              text: 'Completed Tasks',
            ),
            Tab(
              text: 'Uncompleted Tasks',
            ),
          ],
          isScrollable: true,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
                controller: tabController,
                children: [AllTasks(), CompleteTasks(), InCompleteTasks()]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return NewTask();
            },
          ));
        },
      ),
    );
  }
}
