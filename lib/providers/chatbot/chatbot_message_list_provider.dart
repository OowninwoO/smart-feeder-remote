import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_feeder_remote/models/chat/chat_message.dart';

part 'chatbot_message_list_provider.g.dart';

final chatbotMessageListProvider = chatbotMessageListProviderProvider;

@Riverpod(keepAlive: true)
class ChatbotMessageListProvider extends _$ChatbotMessageListProvider {
  @override
  List<ChatMessage> build() => [];

  int addQuestion(String question) {
    state = [...state, ChatMessage(question: question)];
    return state.length - 1;
  }

  void setAnswer({required int index, required String answer}) {
    if (index < 0 || index >= state.length) return;

    final next = [...state];
    next[index] = next[index].copyWith(answer: answer);
    state = next;
  }
}
