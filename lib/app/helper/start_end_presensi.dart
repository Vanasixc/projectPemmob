import 'package:flutter/material.dart';

Future<DateTime?> pickDateTime(BuildContext context, {DateTime? initial}) async {
  final now = DateTime.now();
  final base = initial ?? now;

  final date = await showDatePicker(
    context: context,
    initialDate: base,
    firstDate: now.subtract(const Duration(days: 1)),
    lastDate: now.add(const Duration(days: 30)),
  );
  if (date == null) return null;

  final time = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.fromDateTime(base),
  );
  if (time == null) return null;

  return DateTime(date.year, date.month, date.day, time.hour, time.minute);
}
