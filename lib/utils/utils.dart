import 'package:flutter/material.dart';

String convertUnixTimestampToString(int timestamp) {
  print(timestamp);
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return '${monthsInYear[date.month]} ${date.day}, ${date.year}';
}

int calculateDayRemaining(int wateringCycle, int lastWatered) {
  final dateHasToWater = (lastWatered + wateringCycle) * 1000;
  final dateRange = DateTimeRange(
      start: DateTime.fromMillisecondsSinceEpoch(dateHasToWater),
      end: DateTime.now());
  return -dateRange.duration.inDays;
}

const monthsInYear = {
  1: "January",
  2: "February",
  3: "March",
  4: "April",
  5: "May",
  6: "June",
  7: "July",
  8: "August",
  9: "September",
  10: "October",
  11: "November",
  12: "December",
};
