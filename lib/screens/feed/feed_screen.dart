import 'package:flutter/material.dart';

import '../../widgets/buttons/app_text_button.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '스마트 급식기를 등록해 보세요',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          const Text('기기를 연결하면 원격 급식, 스케줄 급식, 급식 기록 확인까지 모두 한 곳에서 관리할 수 있어요.'),
          const SizedBox(height: 16),
          const Icon(Icons.pets, size: 80),
          const SizedBox(height: 16),
          const Text(
            '등록된 급식기가 없어요',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          const Text('아래 버튼을 눌러 스마트 급식기를 등록해 주세요.'),
          const SizedBox(height: 16),
          const AppTextButton(label: '스마트 급식기 등록하기', onPressed: null),
        ],
      ),
    );
  }
}
