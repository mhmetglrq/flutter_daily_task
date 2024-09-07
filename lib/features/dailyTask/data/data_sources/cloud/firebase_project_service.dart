import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/project.dart';

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

  Stream<List<ProjectModel>> getProjects(String category) {
    return _firestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection("projects")
        .orderBy("createdAt", descending: true)
        .where("category", isEqualTo: category)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ProjectModel.fromMap(doc.data()))
            .toList());
  }
}
