import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:talent_insider/core/common/result_state.dart';
import 'package:talent_insider/features/authentication/data/models/user.dart';
import 'package:talent_insider/features/authentication/domain/usecases/login.dart';
import 'package:talent_insider/features/authentication/domain/usecases/usecase_auth.dart';

part 'authentication_bloc.freezed.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UsecaseAuth _usecaseAuth;

  AuthenticationBloc(this._usecaseAuth)
      : super(const AuthenticationState.initial()) {
    on<AuthenticationEvent>((event, emit) async {
      await event.map(
        loginRequested: (e) => _handleLogin(e, emit),
        logoutRequested: (e) => _handleLogout(e, emit),
      );
    });
  }

  Future<void> _handleLogin(
    _LoginRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const AuthenticationState.loading());

    try {
      final result = await _usecaseAuth.login(
        LoginParams(
          email: event.email,
          password: event.password,
        ),
      );

      if (result is Success<User>) {
        emit(AuthenticationState.authenticated(result.data));
      } else if (result is Error<User>) {
        emit(AuthenticationState.error(result.message));
      } else {
        emit(const AuthenticationState.error('Unexpected error occurred'));
      }
    } catch (e) {
      emit(AuthenticationState.error('An exception occurred: ${e.toString()}'));
    }
  }

  Future<void> _handleLogout(
    _LogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const AuthenticationState.loading());

    try {
      final result = await _usecaseAuth.logout();

      if (result is Success<void>) {
        emit(const AuthenticationState.unauthenticated());
      } else if (result is Error<void>) {
        emit(AuthenticationState.error(result.message));
      } else {
        emit(const AuthenticationState.error('Unexpected error occurred'));
      }
    } catch (e) {
      emit(AuthenticationState.error('An exception occurred: ${e.toString()}'));
    }
  }
}
