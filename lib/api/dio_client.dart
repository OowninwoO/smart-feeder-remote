import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../services/auth/auth_service.dart';
import '../utils/log_utils.dart';

class DioClient {
  static final Dio dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env['API_BASE_URL']!,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(minutes: 1),
        headers: {'Content-Type': 'application/json'},
      ),
    )
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await AuthService.idToken;
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          LogUtils.d('[DIO][REQ][DATA] ${options.data}');
          handler.next(options);
        },
        onResponse: (response, handler) {
          LogUtils.d('[DIO][RES][DATA] ${response.data}');
          handler.next(response);
        },
        onError: (e, handler) {
          LogUtils.e('[DIO][ERR][DATA] ${e.response?.data ?? e.message}');
          handler.next(e);
        },
      ),
    );
}
