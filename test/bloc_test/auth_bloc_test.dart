import 'package:flutter_daily_task/config/routes/route_names.dart';
import 'package:flutter_daily_task/core/resources/data_state.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/user.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/auth/get_user_usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/auth/sign_out_usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/bloc/auth/remote/remote_auth_bloc.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/bloc/auth/remote/remote_auth_event.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/bloc/auth/remote/remote_auth_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/auth/sign_in_usecase.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/usecases/auth/sign_up_usecase.dart';
import 'auth_bloc_test.mocks.dart';
import 'package:bloc_test/bloc_test.dart';

@GenerateMocks(
    [SignInUseCase, SignUpUseCase, GetUserUseCase, SignOutUseCase, UserEntity])
void main() {
  late RemoteAuthBloc remoteAuthBloc;
  late MockSignInUseCase mockSignInUseCase;
  late MockSignUpUseCase mockSignUpUseCase;
  late MockGetUserUseCase mockGetUserUseCase;
  late MockSignOutUseCase mockSignOutUseCase;

  setUp(() {
    mockSignInUseCase = MockSignInUseCase();
    mockSignUpUseCase = MockSignUpUseCase();
    mockGetUserUseCase = MockGetUserUseCase();
    mockSignOutUseCase = MockSignOutUseCase();
    remoteAuthBloc = RemoteAuthBloc(
      mockSignInUseCase,
      mockSignUpUseCase,
      mockGetUserUseCase,
      mockSignOutUseCase,
    );
  });

  tearDown(() {
    remoteAuthBloc.close();
  });

  blocTest<RemoteAuthBloc, RemoteAuthState>(
    'emits [RemoteAuthDone] when RemoteSignInEvent is added and success',
    build: () {
      when(mockSignInUseCase.call(params: anyNamed('params')))
          .thenAnswer((_) async => DataSuccess<void>(data: null));

      return remoteAuthBloc;
    },
    act: (bloc) => bloc.add(RemoteSignInEvent(
      username: 'deneme@gmail.com',
      password: '12345678',
    )),
    expect: () => [const RemoteAuthDone()],
  );

  blocTest<RemoteAuthBloc, RemoteAuthState>(
    'emits [RemoteAuthError] when RemoteSignInEvent is added and failure occurs',
    build: () {
      // Hata durumunda DataError döndürüyoruz
      when(mockSignInUseCase.call(params: anyNamed('params')))
          .thenAnswer((_) async => DataError(message: 'Login failed'));

      return remoteAuthBloc;
    },
    act: (bloc) => bloc.add(RemoteSignInEvent(
      username: 'test@example.com',
      password: 'wrongpassword',
    )),
    expect: () => [
      isA<RemoteAuthError>()
          .having((state) => state.message, 'message', 'Login failed'),
    ],
  );
  blocTest<RemoteAuthBloc, RemoteAuthState>(
    'emits [RemoteAuthDone] when RemoteSignOutEvent is added and success',
    build: () {
      when(mockSignOutUseCase.call())
          .thenAnswer((_) async => DataSuccess<void>(data: null));

      return remoteAuthBloc;
    },
    act: (bloc) => bloc.add(RemoteSignOutEvent()),
    expect: () => [const RemoteAuthDone(userEntity: null)],
  );

  blocTest<RemoteAuthBloc, RemoteAuthState>(
    'emits [RemoteAuthError] when RemoteSignOutEvent is added and failure occurs',
    build: () {
      when(mockSignOutUseCase.call())
          .thenAnswer((_) async => DataError(message: "Sign out failed"));
      return remoteAuthBloc;
    },
    act: (bloc) => bloc.add(RemoteSignOutEvent()),
    expect: () => [
      isA<RemoteAuthError>()
          .having((state) => state.message, "message", "Sign out failed")
    ],
  );

  group('GetUserEvent Test', () {
    blocTest<RemoteAuthBloc, RemoteAuthState>(
      'emits [RemoteAuthDone] when GetUserEvent is added and success',
      build: () {
        when(mockGetUserUseCase.call()).thenAnswer((_) async => DataSuccess(
              data: MockUserEntity(),
            ));

        return remoteAuthBloc;
      },
      act: (bloc) => bloc.add(GetUserEvent()),
      expect: () => [
        isA<RemoteAuthDone>()
            .having((state) => state.user, 'userEntity', isA<MockUserEntity>())
            .having((state) => state.initialRoute, 'initialRoute', '/home'),
      ],
    );

    blocTest<RemoteAuthBloc, RemoteAuthState>(
      'emits [RemoteAuthError] when GetUserEvent is added and failure occurs',
      build: () {
        // Hata durumunda DataError döndürüyoruz
        when(mockGetUserUseCase.call())
            .thenAnswer((_) async => DataError(message: 'User not found'));

        return remoteAuthBloc;
      },
      act: (bloc) => bloc.add(GetUserEvent()), // Event tetikliyoruz
      expect: () => [
        isA<RemoteAuthError>()
            .having((state) => state.message, "message", 'User not found'),
      ],
    );
  });

  group('SignUpEvent Test', () {
    blocTest<RemoteAuthBloc, RemoteAuthState>(
      'emits [RemoteAuthDone] when SignUpEvent is added and success',
      build: () {
        // Başarılı durum için mockSignUpUseCase'i ayarla
        when(mockSignUpUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) async => DataSuccess(data: MockUserEntity()));

        return remoteAuthBloc;
      },
      act: (bloc) => bloc.add(RemoteSignUpEvent(
        user: MockUserEntity(),
      )),
      expect: () => [
        isA<RemoteAuthDone>()
            .having((state) => state.user, 'userEntity', isA<MockUserEntity>()),
      ],
    );

    blocTest<RemoteAuthBloc, RemoteAuthState>(
      'emits [RemoteAuthError] when SignUpEvent is added and failure occurs',
      build: () {
        // Hata durumu için mockSignUpUseCase'i ayarla
        when(mockSignUpUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) async => DataError(message: 'Sign up failed'));

        return remoteAuthBloc;
      },
      act: (bloc) => bloc.add(RemoteSignUpEvent(
        user: MockUserEntity(),
      )),
      expect: () => [
        isA<RemoteAuthError>()
            .having((state) => state.message, 'message', 'Sign up failed'),
      ],
    );
  });
}
