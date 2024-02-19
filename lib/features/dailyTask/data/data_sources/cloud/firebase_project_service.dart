import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/project.dart';

class FirebaseProjectService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createProject(ProjectModel project) async {
    await _firestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection("projects")
        .doc(project.uid)
        .set(project.toMap());
  }
}
