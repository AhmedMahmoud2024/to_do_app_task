class TaskModel {
  final String id ;
  final String title;
  
  TaskModel({
    required this.id,
    required this.title,
  });

  Map<String,dynamic> toMap(){
    return{
      'id':id,
      'title':title,
    };
  }
 factory TaskModel. fromMap(Map<String,dynamic>map){
   return TaskModel(
     id:map['id'] ?? '', 
    title: map["title"] ?? '',
 
    );
 }
 }