import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytasks_sqlite_provider/tabbar/tabbar.dart';
import 'package:provider/provider.dart';
import 'conistant/constant.dart';
import 'database_helper/dbHelper.dart';

class SplachPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DBHelper.dbHelper.getAllTasks().then((value) => {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            Provider.of<AppProvider>(context, listen: false)
                .setTask(List.from(value));
            return TapBar();
          }))
        });
    return Scaffold(
      body: Center(
        child: Text("Wellcome..."),
      ),
    );
  }
}
