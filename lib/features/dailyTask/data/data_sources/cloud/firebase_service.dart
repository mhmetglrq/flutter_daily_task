import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/user.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signIn(String username, String password) async {
    await _auth.signInWithEmailAndPassword(email: username, password: password);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> createUser(UserModel user) async {
    _auth
        .createUserWithEmailAndPassword(
            email: user.email!, password: user.password!)
        .then(
          (value) async => _firestore.collection('users').add(
                user.toMap(),
              ),
        );
  }
}
