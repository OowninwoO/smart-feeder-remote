import 'main_dio_client.dart';

class UsersApi {
  /// provider/providerUserId는 미들웨어에서 자동으로 생성/조회되므로 요청에 포함하지 않습니다.
  /// 내 프로필(닉네임/프로필 이미지) 정보 저장/갱신 요청
  static Future<Map<String, dynamic>> upsertMe({
    String? nickname,
    String? profileImageUrl,
  }) async {
    final response = await MainDioClient.dio.post(
      '/api/users/upsertMe',
      data: {'nickname': nickname, 'profileImageUrl': profileImageUrl},
    );

    return response.data;
  }

  static Future<Map<String, dynamic>> withdraw() async {
    final response = await MainDioClient.dio.delete('/api/users/withdraw');

    return response.data;
  }
}
