import 'dio_client.dart';

class MqttLogsApi {
  static Future<Map<String, dynamic>> all() async {
    final response = await DioClient.dio.get('/api/mqtt-logs/all');

    return response.data;
  }
}
