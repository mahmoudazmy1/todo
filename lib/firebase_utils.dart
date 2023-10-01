import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_repeat/models/task.dart';

class FirebaseUtils {
  static CollectionReference<Task> getTasksCollection() {
    return FirebaseFirestore.instance.collection('tasks').withConverter<Task>(
          fromFirestore: (snapshot, options) =>
              Task.fromFireStore(snapshot.data()!),
          toFirestore: (task, options) => task.toFireStore(),
        );
  }

  static Future<void> addTaskToFirebase(Task task) {
    var taskcollection = getTasksCollection();
    DocumentReference<Task> docRef = taskcollection.doc();
    task.id = docRef.id;
    return docRef.set(task);
  }
}
