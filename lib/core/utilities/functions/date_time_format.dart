import 'package:intl/intl.dart';

String formatDateTime(String input) {
  try {
    // Parse the original format
    final dateTime = DateFormat('dd-MM-yyyy HH:mm:ss').parse(input);

    // Format to desired output
    return DateFormat('dd-MM-yyyy hh:mm a').format(dateTime);
  } catch (e) {
    // Handle invalid format
    return 'not available';
  }
}
