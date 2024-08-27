import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/user.dart';

class FirebaseAuthService {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  FirebaseAuthService({required this.auth, required this.firestore});

  Future<User> signIn(String username, String password) async {
    return await auth
        .signInWithEmailAndPassword(email: username, password: password)
        .then((value) => value.user!);
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  Future<UserModel> createUser(UserModel user) async {
    final createdUser = await auth.createUserWithEmailAndPassword(
        email: user.email!, password: user.password!);

    UserModel userModel = UserModel(
      createdAt: createdUser.user!.metadata.creationTime,
      email: user.email,
      uid: createdUser.user!.uid,
      projects: const [],
      tasks: const [],
      password: user.password,
    );
    log(userModel.toString());
    await firestore.collection('users').doc(userModel.uid).set(
          userModel.toMap(),
        );
    return userModel;
  }

  Future<UserModel?> getUser() async {
    return await firestore
        .collection("users")
        .doc(auth.currentUser?.uid)
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
