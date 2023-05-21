import 'package:intl/intl.dart';

class CustomUtil {
  static String numToText(int num) {
    String numText = '';
    if (num > 999) {
      var formatter = NumberFormat('#,000');
      numText = formatter.format(num);
    } else {
      numText = num.toString();
    }
    return numText;
  }
}
