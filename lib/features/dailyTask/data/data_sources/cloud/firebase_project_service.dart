import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/project.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/status.dart';

class FirebaseProjectService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createProject(ProjectModel project) async {
    return await _firestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection("projects")
        .doc(project.uid)
        .set(project.toMap());
  }

  Future<StatusModel?> getProjectStatus(String projectId) async {
    return await _firestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection("projects")
        .doc(projectId)
        .get()
        .then((value) {
      final projectModel = ProjectModel.fromMap(value.data()!);
      return StatusModel.fromEntity(projectModel.status!);
    });
  }
}
