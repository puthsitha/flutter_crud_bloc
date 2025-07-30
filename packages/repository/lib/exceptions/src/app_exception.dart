//App
import 'package:repository/exceptions/src/http_exception.dart';

class AppException extends HttpException {
  AppException({required String message}) : super('app-exception', message);
}

class NoAddressException extends HttpException {
  NoAddressException() : super('no-address-exception', 'No address');
}
