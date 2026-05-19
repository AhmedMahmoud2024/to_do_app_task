import 'package:flutter/material.dart';
import 'package:to_do_list_app/to_do_list/models/task_model.dart';
class TaskItem extends StatelessWidget{
  final TaskModel task;
  final VoidCallback onToggle;
  final VoidCallback onDelete;
  const TaskItem({
  super.key,
  required this.task,
  required this.onToggle,
  required this.onDelete
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 4,horizontal: 16),
        child: ListTile(
            leading: Checkbox(
                value: task.isCompleted,
                 onChanged: (_)=>onToggle()
                 ),
                 title: Text(
                    task.title,
                    style: TextStyle(
                        decoration: task.isCompleted? TextDecoration.lineThrough
                        :null
                    ),
                 ),
                 trailing: IconButton(
                    onPressed: onDelete, 
                    icon: Icon(Icons.delete_outline,color: Colors.red,)
                    ),
        ),
    );
  }
}