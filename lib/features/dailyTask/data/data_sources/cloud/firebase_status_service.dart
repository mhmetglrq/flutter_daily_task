import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/status.dart';

class FirebaseStatusService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createStatus(StatusModel status) async {
    await _firestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection('status')
        .doc(status.uid)
        .set(status.toMap());
  }
}
