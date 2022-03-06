
import 'package:multiquimica_store_app/common/utils/formatter.dart';

extension Formatters  on int {
  String toFormattedString() {
    return Formatter.formatNumber(this);
  }

}

extension Converters  on int {

}