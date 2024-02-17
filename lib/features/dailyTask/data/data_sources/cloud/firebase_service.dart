import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/task.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/user.dart';

import '../../model/project.dart';

class FirebaseService {
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

  Future<User> createUser(UserModel user) async {
    User firebaseUser = await _auth
        .createUserWithEmailAndPassword(
            email: user.email!, password: user.password!)
        .then((value) => value.user!);
    UserModel userModel = UserModel(
      uid: firebaseUser.uid,
      name: user.name,
      surname: user.surname,
      email: user.email,
      password: user.password,
      projects: user.projects
          ?.map((entity) => ProjectModel.fromEntity(entity))
          .toList(),
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
      tasks: user.tasks?.map((entity) => TaskModel.fromEntity(entity)).toList(),
    );
    await _firestore.collection('users').doc(userModel.uid).set(
          userModel.toMap(),
        );
    return firebaseUser;
  }
}
