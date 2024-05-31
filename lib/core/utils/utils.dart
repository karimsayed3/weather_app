import 'dart:math';

import 'package:intl/intl.dart';

String generateUniqueString() {
  // Use part of the current timestamp
  String timestampPart = DateTime.now().microsecondsSinceEpoch.toString().substring(6);

  // Generate a random component
  String randomPart = Random().nextInt(999999).toString().padLeft(6, '0');

  // Combine the timestamp and random parts
  String uniqueString = timestampPart + randomPart;

  return uniqueString;
}



String changeDateFormat({
  required String timestamp,
}){
  // Parse the timestamp string into a DateTime object
  DateTime dateTime = DateTime.parse(timestamp);

  // Format the DateTime object to "dd-MM HH:mm" (day-month hour:minute) format
  String formattedDate = DateFormat('dd-MM HH:mm').format(dateTime);
  return formattedDate;
}