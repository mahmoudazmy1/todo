import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_repeat/firebase_utils.dart';
import 'package:todo_repeat/models/task.dart';

class ListProvider extends ChangeNotifier {
  List<Task> taskList = [];

  void getAllTasksFromFirestore() async {
    QuerySnapshot<Task> querySnapshot =
        await FirebaseUtils.getTasksCollection().get();
    taskList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    notifyListeners();
  }
}
