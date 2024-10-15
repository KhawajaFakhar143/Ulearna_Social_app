import 'package:intl/intl.dart';

String convertDate(String? dateString) {
  if (dateString?.isNotEmpty ?? false) {
    DateTime inputDate = DateTime.parse(dateString!).toLocal();
    return DateFormat('dd-MM-yyyy').format(inputDate);
  }else{
    return "";
  }
}


String formatDuration(int? seconds) {
if(seconds == null) return "";

  int minutes = seconds ~/ 60; 
  int remainingSeconds = seconds % 60;

  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = remainingSeconds.toString().padLeft(2, '0');

  return '$minutesStr:$secondsStr';
}
