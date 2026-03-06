import 'dio_client.dart';

class QnasApi {
  static Future<Map<String, dynamic>> getAnswer({required String text}) async {
    final response = await DioClient.dio.post(
      '/api/qnas/similarity',
      data: {'text': text},
    );

    return response.data;
  }
}
