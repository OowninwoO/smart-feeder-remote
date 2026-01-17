import 'dio_client.dart';

class DevicesApi {
  static Future<Map<String, dynamic>> register({
    required String deviceId,
    required String deviceName,
    required String location,
  }) async {
    final response = await DioClient.dio.post(
      '/api/devices/register',
      data: {
        'deviceId': deviceId,
        'deviceName': deviceName,
        'location': location,
      },
    );

    return response.data;
  }

  static Future<Map<String, dynamic>> myDevices() async {
    final response = await DioClient.dio.get('/api/devices/my-devices');

    return response.data;
  }

  static Future<Map<String, dynamic>> deleteDevice({
    required String deviceId,
  }) async {
    final response = await DioClient.dio.delete('/api/devices/$deviceId');

    return response.data;
  }
}
