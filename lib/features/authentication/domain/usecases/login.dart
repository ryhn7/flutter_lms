import 'package:talent_insider/core/common/result_state.dart';
import 'package:talent_insider/features/authentication/data/models/user.dart';
import 'package:talent_insider/features/authentication/domain/repositories/authentication_repository.dart';

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}

class Login {
  final AuthenticationRepository _repository;

  Login({
    required AuthenticationRepository repository,
  }) : _repository = repository;

  Future<ResultState<User>> call(LoginParams params) {
    return _repository.login(params.email, params.password);
  }
}
