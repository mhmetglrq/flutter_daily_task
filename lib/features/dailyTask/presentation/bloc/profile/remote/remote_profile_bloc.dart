import 'package:flutter_bloc/flutter_bloc.dart';

import 'remote_profile_event.dart';
import 'remote_profile_state.dart';

class RemoteProfileBloc extends Bloc<RemoteProfileEvent, RemoteProfileState> {
  RemoteProfileBloc() : super(const ProfileInitial());
}
