import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';

part 'chat_message.g.dart';

@freezed
abstract class ChatMessage with _$ChatMessage {
  const factory ChatMessage({required String question, String? answer}) =
      _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}
