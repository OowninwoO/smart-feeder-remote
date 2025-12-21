import 'package:logger/logger.dart';

class LogUtils {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      stackTraceBeginIndex: 1,
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
    ),
  );

  static void d(dynamic message) {
    _logger.d(message);
  }

  static void e(dynamic message) {
    _logger.e(message);
  }
}
