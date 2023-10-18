import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/data_model.dart';

class SettingsProvider extends ChangeNotifier {
  int currentSelectedTabIndex = 0;
  List<TodoDM> todos = [];
  DateTime selectedDate = DateTime.now();

  void currentSelectedTabIndexChanger(index) {
    currentSelectedTabIndex = index;
    notifyListeners();
  }

  refreshTodoList() async {
    CollectionReference<TodoDM> todosCollection = FirebaseFirestore.instance
        .collection("todos")
        .withConverter<TodoDM>(fromFirestore: (docSnapShot, _) {
      Map json = docSnapShot.data() as Map;
      TodoDM todo = TodoDM.fromJson(json);
      return todo;
    }, toFirestore: (todoDM, _) {
      return todoDM.toJson();
    });

    QuerySnapshot<TodoDM> todosSnapshot = await todosCollection
        .orderBy("date")
        .get();

    List<QueryDocumentSnapshot<TodoDM>> docs = todosSnapshot.docs;

    todos = docs.map((docSnapshot) {
      return docSnapshot.data();
    }).toList();

    todos = todos.where((todo) {
      if(todo.date.day != selectedDate.day ||
          todo.date.month != selectedDate.month ||
          todo.date.year != selectedDate.year){
        return false;
      }else{
        return true;
      }
    }).toList();
    notifyListeners();
  }
}
