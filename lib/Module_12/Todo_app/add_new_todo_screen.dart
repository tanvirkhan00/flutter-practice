import 'package:flutter/material.dart';
import 'package:flutter_practice_project/Module_12/Todo_app/todo_main_screen.dart';

class addNewTodoscreen extends StatefulWidget {
  const addNewTodoscreen({super.key});

  @override
  State<addNewTodoscreen> createState() => _addNewTodoscreenState();
}

class _addNewTodoscreenState extends State<addNewTodoscreen> {
  final TextEditingController _titleTEController= TextEditingController();
  final TextEditingController _descriptionTEController= TextEditingController();
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleTEController,
                decoration: InputDecoration(
                  hintText: 'Title'
                ),
                validator: (String? value) {
                  if(value?.trim().isEmpty ?? true) {
                    return "Enter a valid title";
                  }
                },
              ),
              TextFormField(
                controller: _descriptionTEController,
                decoration: InputDecoration(
                  hintText: 'Decoration'
                ),
                validator: (String? value) {
                  if(value?.trim().isEmpty ?? true) {
                    return "Enter a valid Description";
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: (){
                if(_formKey.currentState!.validate() == false) {
                  return;
                }
                Todo todo = Todo(title: _titleTEController.text.trim(),
                    description: _descriptionTEController.text.trim(),
                    status: 'Pending',
                    date: DateTime.now());
                Navigator.pop(context, todo);
              }, child: Text('Done'))
            ],
          ),
        ),
      ),
    );
  }
}
