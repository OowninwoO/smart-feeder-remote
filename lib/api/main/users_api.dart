import 'main_dio_client.dart';

class UsersApi {
  static Future<Map<String, dynamic>> withdraw() async {
    final response = await MainDioClient.dio.delete('/api/users/withdraw');

    return response.data;
  }
}
