import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_uicoder_getx_todoapp/controllers/todo_controller.dart';
import 'package:yt_uicoder_getx_todoapp/screens/widgets/todo_form.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final todoControllerP = Get.find<TodoController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: GetBuilder(
        builder: (TodoController todoController) {
          return ListView.builder(
            itemCount: todoController.todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return TodoForm(
                        type: 'update',
                        todo: todoController.todos[index],
                      );
                    },
                  );
                },
                leading: Checkbox(
                  value: todoController.todos[index].isCompleted,
                  onChanged: (value) {
                    todoController.changeStatus(todoController.todos[index]);
                  },
                ),
                title: Text(todoController.todos[index].description!),
                trailing: IconButton(
                  onPressed: () {
                    todoControllerP.deleteTodo(todoController.todos[index].id);
                  },
                  icon: Icon(Icons.delete),
                ),
              );
              // return Text('Null');
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return TodoForm(type: 'new');
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
