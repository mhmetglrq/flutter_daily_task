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

  Stream<List<ProjectModel>> getProjects(String category,
      {String? projectName}) {
    return _firestore
        .collection("projects")
        .where('name', isLessThanOrEqualTo: '$projectName\uf8ff')
        .where('name', isGreaterThanOrEqualTo: projectName)
        .where("category", isEqualTo: category)
        // .orderBy("createdAt", descending: true)
        .limit(10)
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
