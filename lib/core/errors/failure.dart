import 'package:equatable/equatable.dart';

/// Base Failure class for application errors
abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object> get props => [message];
}

/// Server failures related to API or remote data sources
class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

/// Cache failures related to local storage
class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}

/// Network failure related to connectivity issues
class NetworkFailure extends Failure {
  const NetworkFailure({required super.message});
}

/// Authentication failure related to login, register, etc.
class AuthenticationFailure extends Failure {
  const AuthenticationFailure({required super.message});
}
