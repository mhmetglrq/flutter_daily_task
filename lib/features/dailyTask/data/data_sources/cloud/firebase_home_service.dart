import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/project.dart';

class FirebaseHomeService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProjectModel>> getProjects() async {
    List<ProjectModel> projects = [];
    await _firestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection("projects")
        .get()
        .then((value) {
      for (var element in value.docs) {
        projects.add(ProjectModel.fromJson(element.data()));
      }
    });
    return projects;
  }
}