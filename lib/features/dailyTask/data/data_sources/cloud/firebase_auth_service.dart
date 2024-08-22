import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/task.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/user.dart';

import '../../model/project.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User> signIn(String username, String password) async {
    return await _auth
        .signInWithEmailAndPassword(email: username, password: password)
        .then((value) => value.user!);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<UserModel> createUser(UserModel user) async {
    UserModel userModel = const UserModel();
    _auth
        .createUserWithEmailAndPassword(
            email: user.email!, password: user.password!)
        .then((value) {
      List<ProjectModel>? projects = user.projects
          ?.map((entity) => ProjectModel.fromEntity(entity))
          .toList();
      userModel = UserModel(
        uid: value.user?.uid,
        name: user.name,
        surname: user.surname,
        email: user.email,
        password: user.password,
        projects: projects,
        createdAt: user.createdAt,
        updatedAt: user.updatedAt,
        tasks:
            user.tasks?.map((entity) => TaskModel.fromEntity(entity)).toList(),
      );
    });

    await _firestore.collection('users').doc(userModel.uid).set(
          userModel.toMap(),
        );
    return userModel;
  }

  Future<UserModel?> getUser() async {
    return await _firestore
        .collection("users")
        .doc(_auth.currentUser?.uid)
        .get()
        .then((value) {
      if (value.exists) {
        return UserModel.fromMap(value.data()!);
      } else {
        return null;
      }
    });
  }
}
