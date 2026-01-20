import 'dio_client.dart';

class UsersApi {
  /// 유저 생성/갱신 요청
  static Future<Map<String, dynamic>> upsertMe({
    String? nickname,
    String? profileImageUrl,
  }) async {
    final response = await DioClient.dio.post(
      '/api/users/upsertMe',
      data: {'nickname': nickname, 'profileImageUrl': profileImageUrl},
    );

    return response.data;
  }
}
