import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/project.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/status.dart';

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

  Future<List<StatusModel>> getStatusList() async {
    List<StatusModel> status = [];
    await _firestore.collection("status").get().then((value) {
      for (var element in value.docs) {
        status.add(StatusModel.fromJson(element.data()));
      }
    });
    return status;
  }
}
