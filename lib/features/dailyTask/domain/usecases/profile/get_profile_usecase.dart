import 'package:flutter_daily_task/core/usecase/usecase.dart';

import '../../../../../core/resources/data_state.dart';
import '../../entities/user.dart';
import '../../repository/profile_repository.dart';

class GetProfileUseCase implements UseCase<DataState<UserEntity>, void> {
  final ProfileRepository _profileRepository;

  GetProfileUseCase(this._profileRepository);
  @override
  Future<DataState<UserEntity>> call({void params}) async {
    return await _profileRepository.getProfile();
  }
}
