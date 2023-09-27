import 'package:intl/intl.dart';

class DataNow {
  String getData() {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    String currentDate = dateFormat.format(DateTime.now());
    return currentDate; // Выведет текущую дату в формате "2023-09-17"
  }
}

class DataMatch {
  bool match;
  DataMatch({this.match = false});
  String getData(data) {
    String timeString = data;
    DateTime dateTime = DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(timeString);
    DateTime utcTime = DateTime.utc(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      dateTime.hour,
      dateTime.minute,
    );
    final localTime = utcTime.toLocal().toString();
    List<String> parts = localTime.split(" ");

    String timePart = parts[1];
    List<String> dateTimes = timePart.split(":");
    if (!match) {
      String datePart = parts[0];
      List<String> dateComponents = datePart.split("-");

      String formattedTime =
          "${dateComponents[2]}.${dateComponents[1]} - ${dateTimes[0]}:${dateTimes[1]}";
      return (formattedTime);
    } else {
      return '${dateTimes[0]}:${dateTimes[1]}';
    }
  }
}
