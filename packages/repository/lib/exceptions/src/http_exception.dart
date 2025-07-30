class HttpException implements Exception {
  HttpException(this.code, this.message);
  final String code;
  final String message;

  @override
  String toString() => message;
}
