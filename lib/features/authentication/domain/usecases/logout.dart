import 'package:talent_insider/core/common/result_state.dart';
import 'package:talent_insider/features/authentication/domain/repositories/authentication_repository.dart';

class Logout {
  final AuthenticationRepository _authRepository;

  Logout({
    required AuthenticationRepository repository,
  }) : _authRepository = repository;

  Future<ResultState<void>> call() async {
    return await _authRepository.logout();
  }
}