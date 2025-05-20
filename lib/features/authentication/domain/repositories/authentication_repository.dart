import 'package:talent_insider/core/common/result_state.dart';
import 'package:talent_insider/features/authentication/data/models/user.dart';

abstract interface class AuthenticationRepository {
  Future<ResultState<User>> login(String email, String password);
  Future<ResultState<void>> logout();
}
