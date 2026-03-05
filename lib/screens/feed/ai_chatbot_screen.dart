import 'package:flutter/material.dart';

class AiChatbotScreen extends StatelessWidget {
  const AiChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI 챗봇'), centerTitle: true),
      body: const Center(child: Text('AI 챗봇 화면')),
    );
  }
}
