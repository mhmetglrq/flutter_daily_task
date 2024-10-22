import '../../../../../core/usecase/usecase.dart';
import '../../entities/project.dart';
import '../../repository/project_repository.dart';

class GetProjectsUsecase
    implements UseCaseStream<List<ProjectEntity>, FetchProjectsParams?> {
  final ProjectRepository _projectRepository;

  GetProjectsUsecase(this._projectRepository);

  @override
  Stream<List<ProjectEntity>> call({FetchProjectsParams? params}) {
    return _projectRepository.getProjects(category: params?.category, projectName: params?.projectName);
  }
}

class FetchProjectsParams {
  final String? category;
  final String? projectName;

  FetchProjectsParams({this.category, this.projectName});
}
