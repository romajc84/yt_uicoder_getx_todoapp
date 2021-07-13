import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_uicoder_getx_todoapp/controllers/todo_controller.dart';
import 'package:yt_uicoder_getx_todoapp/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoController = Get.put<TodoController>(TodoController());
    return MaterialApp(
      title: 'Flutter Todo GetX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
