

import 'package:multiquimica_store_app/common/utils/formatter.dart';

extension Formatters  on String {
  String formatNumber() {
    return Formatter.formatNumber(this);
  }

}

extension Converters  on String {
  int toInt() {
    return int.tryParse(this) ?? 0;
  }

  double get doubleVal => double.parse(this);

}