import 'package:flutter/material.dart';

import '../../api/devices_api.dart';
import '../../utils/log_utils.dart';
import '../../widgets/buttons/app_text_button.dart';

class DeviceRegisterScreen extends StatefulWidget {
  const DeviceRegisterScreen({super.key, required this.deviceId});

  final String deviceId;

  @override
  State<DeviceRegisterScreen> createState() => _DeviceRegisterScreenState();
}

class _DeviceRegisterScreenState extends State<DeviceRegisterScreen> {
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
    } catch (e) {
      LogUtils.e(e);
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
                  onFieldSubmitted: (_) => _onSubmit(),
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
