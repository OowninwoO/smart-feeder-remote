import 'package:flutter/material.dart';
import 'package:smart_feeder_remote/api/qnas_api.dart';
import 'package:smart_feeder_remote/models/chat/chat_message.dart';
import 'package:smart_feeder_remote/theme/app_colors.dart';
import 'package:smart_feeder_remote/widgets/buttons/app_icon_button.dart';
import 'package:smart_feeder_remote/widgets/cards/app_card.dart';

class AiChatbotScreen extends StatefulWidget {
  const AiChatbotScreen({super.key});

  @override
  State<AiChatbotScreen> createState() => _AiChatbotScreenState();
}

class _AiChatbotScreenState extends State<AiChatbotScreen> {
  final _textController = TextEditingController();
  final List<ChatMessage> _messages = [];

  Future<void> _sendMessage() async {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    final messageIndex = _messages.length;

    setState(() {
      _messages.add(ChatMessage(question: text));
    });

    _textController.clear();

    try {
      final response = await QnasApi.getAnswer(text: text);

      setState(() {
        _messages[messageIndex] = _messages[messageIndex].copyWith(
          answer: response.toString(),
        );
      });
    } catch (e) {
      setState(() {
        _messages[messageIndex] = _messages[messageIndex].copyWith(
          answer: '응답을 불러오지 못했습니다.',
        );
      });
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text('AI 챗봇'), centerTitle: true),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: _messages.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final message = _messages[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppCard(
                            color: AppColors.cardSecondary,
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.7,
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                message.question,
                                style: const TextStyle(
                                  color: AppColors.textOnLight,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppCard(
                            color: AppColors.cardPrimary,
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.7,
                              ),
                              padding: const EdgeInsets.all(16),
                              child: message.answer == null
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : Text(
                                      message.answer!,
                                      style: const TextStyle(
                                        color: AppColors.textOnLight,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.secondary),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.secondary),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.secondary),
                        ),
                        hintText: '메시지를 입력하세요',
                      ),
                      minLines: 1,
                      maxLines: 5,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  const SizedBox(width: 16),
                  AppIconButton(icon: Icons.send, onPressed: _sendMessage),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
