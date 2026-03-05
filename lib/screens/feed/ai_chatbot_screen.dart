import 'package:flutter/material.dart';
import 'package:smart_feeder_remote/theme/app_colors.dart';
import 'package:smart_feeder_remote/widgets/buttons/app_icon_button.dart';
import 'package:smart_feeder_remote/widgets/cards/app_card.dart';

class AiChatbotScreen extends StatelessWidget {
  const AiChatbotScreen({super.key});

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
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: index.isEven
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    children: [
                      AppCard(
                        color: index.isEven
                            ? AppColors.cardPrimary
                            : AppColors.cardSecondary,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            '임시 채팅 $index',
                            style: const TextStyle(
                              color: AppColors.textOnLight,
                            ),
                          ),
                        ),
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
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
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
                      textInputAction: TextInputAction.send,
                      minLines: 1,
                      maxLines: 5,
                    ),
                  ),
                  const SizedBox(width: 16),
                  AppIconButton(icon: Icons.send, onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
