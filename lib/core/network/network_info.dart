/// Abstract class to check network connectivity
abstract class NetworkInfo {
  Future<bool> get isConnected;
}
