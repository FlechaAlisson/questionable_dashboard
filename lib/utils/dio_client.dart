import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://questionable-api.jesuisjedi.com',
    ),
  );

  Future<Response?> get(String path) async => await _dio.get(path);
}
