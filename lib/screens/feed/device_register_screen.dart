import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../api/devices_api.dart';
import '../../utils/log_utils.dart';
import '../../utils/toast_utils.dart';
import '../../utils/user_data_sync.dart';
import '../../widgets/buttons/app_text_button.dart';

class DeviceRegisterScreen extends ConsumerStatefulWidget {
  const DeviceRegisterScreen({super.key, required this.deviceId});

  final String deviceId;

  @override
  ConsumerState<DeviceRegisterScreen> createState() =>
      _DeviceRegisterScreenState();
}

class _DeviceRegisterScreenState extends ConsumerState<DeviceRegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _deviceNameController = TextEditingController();
  final _locationController = TextEditingController();

  @override
  void dispose() {
    _deviceNameController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (_formKey.currentState?.validate() != true) return;

    final deviceName = _deviceNameController.text.trim();
    final location = _locationController.text.trim();

    try {
      await DevicesApi.register(
        deviceId: widget.deviceId,
        deviceName: deviceName,
        location: location,
      );

      await loadDevices(ref);

      ToastUtils.success('기기가 성공적으로 등록되었습니다.');

      /// 기기 등록 화면 닫기
      context.pop();
    } catch (e) {
      LogUtils.e(e);
      ToastUtils.error('기기 등록에 실패했습니다.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('기기 등록')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InputDecorator(
                  decoration: const InputDecoration(
                    labelText: '디바이스 아이디',
                    border: OutlineInputBorder(),
                  ),
                  child: Text(widget.deviceId),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _deviceNameController,
                  decoration: const InputDecoration(
                    labelText: '디바이스 이름',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return '디바이스 이름을 입력해 주세요.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _locationController,
                  decoration: const InputDecoration(
                    labelText: '장소',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.done,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return '장소를 입력해 주세요.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                AppTextButton(label: '등록', onPressed: _onSubmit),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
