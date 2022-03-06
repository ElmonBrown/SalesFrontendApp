

import 'package:multiquimica_store_app/common/utils/formatter.dart';

extension Formatters  on double {
  String toFormattedString() {
    return Formatter.formatNumber(this);
  }

}

extension Converters  on double {

}