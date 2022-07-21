import 'package:intl/intl.dart';

class AmountUtil {
  static String formatAmount(double amount) {
    final f = NumberFormat('N#,##0', 'en_US');
    return f.format(amount);
  }
}
