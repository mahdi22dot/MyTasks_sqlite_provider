import 'package:flutter/material.dart';
import 'package:mytasks_sqlite_provider/conistant/constant.dart';
import 'package:mytasks_sqlite_provider/splach.dart';
import 'package:provider/provider.dart';
import 'Tasks_opperations/task_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppProvider()
        ),
        ChangeNotifierProvider(create: (_) => Task()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplachPage(),
      ),
    );
  }
}
