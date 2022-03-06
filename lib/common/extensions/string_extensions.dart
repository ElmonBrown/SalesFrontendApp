

import 'package:multiquimica_store_app/common/utils/formatter.dart';

extension Formatters  on String {
  String formatNumber() {
    return Formatter.formatNumber(this);
  }

}

extension Converters  on String {
  int toInt() {
    return int.parse(this);
  }

  double get doubleVal => double.parse(this);

}