import 'dio_client.dart';

class DevicesApi {
  static Future<Map<String, dynamic>> register({
    required String deviceId,
    required String deviceName,
  }) async {
    final response = await DioClient.dio.post(
      '/api/devices/register',
      data: {'deviceId': deviceId, 'deviceName': deviceName},
    );

    return response.data;
  }
}
