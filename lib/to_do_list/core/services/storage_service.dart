import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list_app/to_do_list/models/task_model.dart';

class StorageService {
  static const String _tasksKey='cashed_tasks';

Future<void> saveTasks(List<TaskModel>tasks)async{
 final prefs = await SharedPreferences.getInstance();
 final List<String> jsonStrings = tasks.map((t)=>
 jsonEncode(t.toMap())).toList();
 await prefs.setStringList(_tasksKey, jsonStrings);
}

Future<List<TaskModel>> loadTasks()async{
  final prefs = await SharedPreferences.getInstance();
  final List<String>? jsonStrings = prefs.getStringList(_tasksKey);
  if(jsonStrings ==null){
    return [];
  }
  return jsonStrings.map((s)=>
  TaskModel.fromMap(jsonDecode(s))).toList();
}
}