  import 'package:intl/intl.dart';

String formatDate(DateTime date) {
    return DateFormat('dd MMM, yyyy', 'en').format(date);
  }