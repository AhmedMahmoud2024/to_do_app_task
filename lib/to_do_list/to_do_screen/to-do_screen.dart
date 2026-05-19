import 'package:flutter/material.dart';
import 'package:to_do_list_app/to_do_list/core/services/storage_service.dart';
import 'package:to_do_list_app/to_do_list/models/task_model.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
 List<TaskModel> _tasks=[];
 bool _isLoading = true;
 final TextEditingController _inputController= TextEditingController();

 @override
  void initState() {
    super.initState();
      _fetchTasks();
  }

 Future<void>  _fetchTasks()async{
  final savedTasks= await StorageService().loadTasks();
  setState(() {
    _tasks=savedTasks;
    _isLoading=false;
  });
  }

Future<void>_addTasks(String title)async{
 if(title.trim().isEmpty) return;
 final newTask=TaskModel(
  id: DateTime.now().toIso8601String(),
   title: title
   );
   setState(() {
     _tasks.add(newTask);
     _inputController.clear();
   });
   
   await StorageService().saveTasks(_tasks);
}

Future<void> _toggleTask(int index) async{
 setState(() {
   _tasks[index]=_tasks[index].copyWith(
    isCompleted: !_tasks[index].isCompleted
   );
 });

 await StorageService().saveTasks(_tasks);
 }

Future<void> _deleteTask(int index)async{
 setState(() {
   _tasks.removeAt(index);
 });
 await StorageService().saveTasks(_tasks);
}

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}