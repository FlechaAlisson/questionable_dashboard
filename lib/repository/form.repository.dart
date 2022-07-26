import 'package:dio/dio.dart';

import '../utils/dio_client.dart';

class FormRepository {
  final DioClient _dioClient = DioClient();

  Future<Response?> loadForm() async =>
      await _dioClient.get('/store/1/forms/report/');
}
