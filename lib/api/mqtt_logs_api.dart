import 'dio_client.dart';

class MqttLogsApi {
  static Future<Map<String, dynamic>> list({required String deviceId}) async {
    final response = await DioClient.dio.get(
      '/api/mqtt-logs/list',
      queryParameters: {'deviceId': deviceId},
    );

    return response.data;
  }
}
