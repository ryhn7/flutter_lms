part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.loginRequested({
    required String email,
    required String password,
  }) = _LoginRequested;

  const factory AuthenticationEvent.logoutRequested() = _LogoutRequested;
}
