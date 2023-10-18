import 'package:cloud_firestore/cloud_firestore.dart';

class TodoDM {
  late String title;
  late String description;
  late bool isDone;
  late DateTime date;
  late String id;

  TodoDM(this.title, this.description, this.isDone, this.date, this.id);

  TodoDM.fromJson(Map json){
    title = json["title"];
    description = json["description"];
    isDone = json["isDone"];
    Timestamp time = json["date"];
    date = time.toDate();
    id = json["id"];
  }
  Map<String, Object?> toJson(){
    return {
      "id" : id,
      "title" : title,
      "description" : description,
      "date" : date,
      "isDone" : isDone
     };
  }
}
