import 'package:intl/intl.dart';

class Formatter {
  Formatter._();

  static final dateFormat = "dd/MM/yyyy";

  static String dateToString(DateTime date) {
    return DateFormat(dateFormat).format(date);
  }

  static String formatDate(String date) {
    return date.isNotEmpty
        ? DateFormat(dateFormat).format(DateTime.parse(date))
        : date;
  }

  static String formatNumber(dynamic number) {
    final numFormat = new NumberFormat("#,##0.00", "en_US");
    return numFormat.format(number);
  }
}
