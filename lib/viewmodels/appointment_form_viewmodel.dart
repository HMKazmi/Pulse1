import 'package:flutter/material.dart';

class AppointmentFormViewModel extends ChangeNotifier {
  String visitType = 'PT Meeting';
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String selectedClass = '10A';
  String teacher = '';
  String reason = '';

  final List<String> visitTypes = ['PT Meeting', 'Counselling', 'Follow-up'];
  final List<String> classes = ['10A', '10B', '11A', '12C'];

  void setVisitType(String value) {
    visitType = value;
    notifyListeners();
  }

  void setClass(String value) {
    selectedClass = value;
    notifyListeners();
  }

  void setDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void setTime(TimeOfDay time) {
    selectedTime = time;
    notifyListeners();
  }

  void setTeacher(String value) {
    teacher = value;
    notifyListeners();
  }

  void setReason(String value) {
    reason = value;
    notifyListeners();
  }

  void requestAppointment() {
    // TODO: Hook this up with backend
    debugPrint('Requesting appointment with:');
    debugPrint('VisitType: $visitType, Date: $selectedDate, Time: $selectedTime');
    debugPrint('Class: $selectedClass, Teacher: $teacher, Reason: $reason');
  }
}
