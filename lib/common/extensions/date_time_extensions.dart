import 'package:multiquimica_store_app/common/utils/formatter.dart';

extension Formatters  on DateTime {
  String toFormattedString() {
    return Formatter.dateToString(this);
  }

}

extension Converters  on DateTime {

}