class ServerException implements Exception {
  final String message;
  final int statusCode;

  ServerException(this.message, {this.statusCode: 404});

  @override
  String toString() => message;

  factory ServerException.fromJson(Map<String, dynamic> json,
          {int code: 404}) =>
      ServerException(json['detail'], statusCode: code);
}

class DeviceException implements Exception {
  final String message;

  DeviceException(this.message);

  @override
  String toString() => message;
}
