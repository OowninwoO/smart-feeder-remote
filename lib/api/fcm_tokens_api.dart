import 'dio_client.dart';

class FcmTokensApi {
  /// provider/providerUserId는 미들웨어에서 자동으로 식별되므로 요청에 포함하지 않습니다.
  /// FCM 토큰 저장/갱신 요청
  static Future<Map<String, dynamic>> upsertFcmToken({
    required String token,
  }) async {
    final response = await DioClient.dio.post(
      '/api/fcmTokens/upsert',
      data: {'token': token},
    );

    return response.data;
  }
}
