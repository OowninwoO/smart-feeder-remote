import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../services/wifi/wifi_connector.dart';

class WifiSetupWebViewScreen extends StatefulWidget {
  const WifiSetupWebViewScreen({super.key});

  @override
  State<WifiSetupWebViewScreen> createState() => _WifiSetupWebViewScreenState();
}

class _WifiSetupWebViewScreenState extends State<WifiSetupWebViewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    final webUrl = dotenv.env['WIFI_SETUP_WEB_URL']!;
    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(webUrl));
  }

  @override
  void dispose() {
    WifiConnector.disableForce();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WebViewWidget(controller: _controller)),
    );
  }
}
