import 'package:flutter/material.dart';
import '../models/attendance_model.dart';

class AttendanceViewModel extends ChangeNotifier {
  List<AttendanceRecord> _records = [
    AttendanceRecord(
      date: DateTime(2025, 4, 30),
      checkIn: '07:58:11 AM',
      checkOut: '02:08:11 PM',
      status: 'Present',
    ),
    AttendanceRecord(
      date: DateTime(2025, 4, 31),
      checkIn: '07:58:11 AM',
      checkOut: '02:08:11 PM',
      status: 'Present',
    ),
    // Add more sample records
  ];

  int get currentWeekPresents => 231;
  int get currentWeekLeaves => 21;
  int get currentWeekAbsents => 13;

  int get currentMonthPresents => 21;
  int get currentMonthLeaves => 2;
  int get currentMonthAbsents => 1;

  List<AttendanceRecord> get records => _records;

  // Future implementation: fetch from API
  // void fetchRecordsFromAPI() async { ... }
}