import 'package:talent_insider/features/authentication/domain/usecases/login.dart';
import 'package:talent_insider/features/authentication/domain/usecases/logout.dart';

class UsecaseAuth {
  final Login login;
  final Logout logout;

  UsecaseAuth({
    required this.login,
    required this.logout,
  });
}