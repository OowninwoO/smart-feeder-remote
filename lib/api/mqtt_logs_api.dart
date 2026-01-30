import 'dio_client.dart';

class MqttLogsApi {
  static Future<Map<String, dynamic>> logs({
    String? cursorAt,
    int? cursorId,
  }) async {
    final response = await DioClient.dio.get(
      '/api/mqtt-logs/logs',
      queryParameters: {
        if (cursorAt != null) 'cursorAt': cursorAt,
        if (cursorId != null) 'cursorId': cursorId,
      },
    );

    return response.data;
  }
}
