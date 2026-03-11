import 'chatbot_dio_client.dart';

class QnasApi {
  static Future<Map<String, dynamic>> getAnswer({required String text}) async {
    final response = await ChatbotDioClient.dio.post(
      '/api/qnas/answer',
      data: {'text': text},
    );

    return response.data;
  }
}
