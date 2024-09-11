import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/member.dart';
import '../../model/project.dart';

class FirebaseProjectService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createProject(ProjectModel project) async {
    project.assigness?.add(const MemberModel(email: "wqeqw"));
    return await _firestore
        .collection("projects")
        .doc(project.uid)
        .set(project.toJson());
  }

  Stream<List<ProjectModel>> getProjects(String category) {
    return _firestore
        .collection("projects")
        .orderBy("createdAt", descending: true)
        .where("category", isEqualTo: category)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ProjectModel.fromJson(doc.data()))
            .toList());
  }

  Future<List<MemberModel>> getMembers({String? email}) async {
    final users = await _firestore
        .collection("users")
        .where("email", isEqualTo: email)
        .get();
    return users.docs.map((doc) => MemberModel.fromJson(doc.data())).toList();
  }
}
