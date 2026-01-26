import 'package:intl/intl.dart';

class DateTimeUtils {
  static String ymdHm(DateTime dt) {
    final local = dt.toLocal();
    return DateFormat('yyyy.MM.dd HH:mm').format(local);
  }

  static String ymdHms(DateTime dt) {
    final local = dt.toLocal();
    return DateFormat('yyyy.MM.dd HH:mm:ss').format(local);
  }
}
