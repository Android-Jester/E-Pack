class ServerException implements Exception {
  final String message;
  final int statusCode;

  ServerException(this.message, {this.statusCode = 404});

  @override
  String toString() => message;

  @override
  // TODO: implement code
  int? get code => throw UnimplementedError();

  @override
  // TODO: implement response
  get response => throw UnimplementedError();
}

class DeviceException implements Exception {
  final String message;

  DeviceException(this.message);

  @override
  String toString() => message;
}