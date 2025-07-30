import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:repository/repository.dart';

class ApiClient {
  ApiClient({required String baseUrl}) {
    instance = Dio();
    (instance.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
    instance.options.baseUrl = baseUrl;

    instance.options.headers.addAll({
      'Content-type': 'application/json; charset=UTF-8',
    });

    instance.interceptors.add(
      LogInterceptor(
        requestBody: true,
        requestHeader: true,
        request: true,
        responseBody: true,
      ),
    );
  }

  void setLanguage(AppLanguage language) {
    instance.options.headers.addAll({
      'Client-Language': language.value,
    });
  }

  late Dio instance;
}

class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor({
    required this.dio,
    // required this.authRepository,
  });

  final Dio dio;
  // final AuthRepository authRepository;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // final authToken = await authRepository.getCurrentToken;

    // if (authToken != null) {
    //   // options.headers['Authorization'] = 'Bearer ${authToken.token}';
    // }

    //Bind lat lng to all api
    return handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    return handler.resolve(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    print('onError : ${err}');
    handler.next(err);
  }
}
