class ServerException implements Exception {
  ServerException([this.message]);

  final dynamic message;
}

class NoInternetException implements Exception {}

class ClientException implements Exception {
  ClientException([this.message = '']);

  final String message;
}

class DBException implements Exception {
  DBException([this.message = '']);

  final String message;
}
