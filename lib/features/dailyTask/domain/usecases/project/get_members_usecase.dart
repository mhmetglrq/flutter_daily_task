import '../../../../../core/resources/data_state.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../entities/member.dart';
import '../../repository/project_repository.dart';

class GetMembersUseCase
    implements UseCase<DataState<List<MemberEntity>>, GetMembersParams> {
  final ProjectRepository _projectRepository;

  GetMembersUseCase(this._projectRepository);

  @override
  Future<DataState<List<MemberEntity>>> call({GetMembersParams? params}) {
    return _projectRepository.getMembers(email: params?.email);
  }
}

class GetMembersParams {
  final String? email;

  GetMembersParams({this.email});
}
