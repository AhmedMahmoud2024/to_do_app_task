import 'package:flutter/material.dart';
import 'package:to_do_list_app/to_do_list/models/task_model.dart';
class TaskItem extends StatelessWidget{
  final TaskModel task;

  const TaskItem({
  super.key,
  required this.task,
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 4,horizontal: 16),
        child: ListTile(
         
                 title: Text(
                    task.title,
                 ),
               
        ),
    );
  }
}