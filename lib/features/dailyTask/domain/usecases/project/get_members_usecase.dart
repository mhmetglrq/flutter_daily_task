import '../../../../../core/resources/data_state.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../entities/member.dart';
import '../../repository/project_repository.dart';

class GetMembersUseCase
    implements UseCase<DataState<List<MemberEntity>>, void> {
  final ProjectRepository _projectRepository;

  GetMembersUseCase(this._projectRepository);

  @override
  Future<DataState<List<MemberEntity>>> call({void params}) {
    return _projectRepository.getMembers();
  }
}

class GetMembersParams {
  final String? category;

  GetMembersParams({this.category});
}
