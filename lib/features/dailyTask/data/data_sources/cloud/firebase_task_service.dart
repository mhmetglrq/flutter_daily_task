import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/task.dart';

class FirebaseTaskService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createTask(TaskModel task) async {
    await _firestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection('tasks')
        .doc(task.uid)
        .set(
          task.toJson(),
        );
  }

  Future<List<TaskModel>> getTasks() async {
    List<TaskModel> tasks = [];
    await _firestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection('tasks')
        .get()
        .then(
      (value) {
        for (var element in value.docs) {
          tasks.add(
            TaskModel.fromJson(
              element.data(),
            ),
          );
        }
      },
    );
    return tasks;
  }
}
