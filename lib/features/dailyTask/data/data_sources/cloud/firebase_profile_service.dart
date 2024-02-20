import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/user.dart';

class FirebaseProfileService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> updateProfile(String name, String surname) async {
    await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
      'name': name,
      'surname': surname,
    });
  }

  Future<UserModel> getProfile() async {
    return await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then(
          (value) => UserModel.fromMap(value.data() as Map<String, dynamic>),
        );
  }

  Future<void> getBadges() async {
    await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
      'badges': FieldValue.increment(1),
    });
  }
}
