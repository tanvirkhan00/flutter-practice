import 'package:flutter/material.dart';
import 'package:flutter_practice_project/Module_12/Todo_app/add_new_todo_screen.dart';

class Todo_screen extends StatefulWidget {
  const Todo_screen({super.key});

  @override
  State<Todo_screen> createState() => _Todo_screenState();
}

class _Todo_screenState extends State<Todo_screen> {
  List<Todo> todoList =[] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do App'),
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder:(context, index) {
            Todo todo = todoList[index];
            return ListTile(
              onLongPress: () {
                todoList.removeAt(index);
                setState(() {});
              },
              title: Text(todo.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(todo.description),
                  Text('Created Date: ${todo.date}')
                ],
              ),
              trailing: Text(todo.status),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        Todo ? todo = await Navigator.push(context, MaterialPageRoute(builder: (context) {
          return addNewTodoscreen();
        }));
        if(todo != null) {
          todoList.add(todo);
          setState(() {});
        }
      }, child: Icon(Icons.add),),
    );
  }
}

class Todo {
  final String title;
  final String description;
  final String status;
  final DateTime date;

  Todo({required this.title,
    required this.description,
    required this.status,
    required this.date
  });
}
