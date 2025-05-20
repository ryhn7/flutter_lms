/// Server exception thrown when a server error occurs
class ServerException implements Exception {
  final String message;

  ServerException({required this.message});
}

/// Cache exception thrown when a local storage error occurs
class CacheException implements Exception {
  final String message;

  CacheException({required this.message});
}

/// Network exception thrown when a network connectivity issue occurs
class NetworkException implements Exception {
  final String message;

  NetworkException({required this.message});
}

/// Authentication exception thrown when an auth error occurs
class AuthenticationException implements Exception {
  final String message;

  AuthenticationException({required this.message});
}
