void main() {
  DateTime now = DateTime.now();

  // print(now);
  // print(now.year);
  // print(now.month);
  // print(now.day);
  // print(now.hour);
  // print(now.minute);
  // print(now.second);
  // print(now.millisecond);

  Duration duration = Duration(seconds: 179);

  // print(duration);
  // print(duration.inDays);
  // print(duration.inMinutes);
  // print(duration.inSeconds);

  DateTime specificDay = DateTime(
    2022,
    12,
    31,
  );

  print(specificDay);

  final difference = now.difference(specificDay);

  print(difference);
  print(difference.inDays);

  print(now.isAfter(specificDay));
  print(now.isBefore(specificDay));
  print(specificDay.isAfter(now));

  print('=====================');
  print(now);
  print(now.add(Duration(hours: 10)));
  print(now.subtract(Duration(seconds: 30)));
}