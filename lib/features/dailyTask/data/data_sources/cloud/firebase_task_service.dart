import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/task.dart';

class FirebaseTaskService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<TaskModel> createTask(TaskModel task) async {
    return await _firestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection('tasks')
        .add(task.toMap())
        .then(
          (value) => value.get().then(
                (value) => TaskModel.fromMap(value.data()!),
              ),
        );
  }
}
