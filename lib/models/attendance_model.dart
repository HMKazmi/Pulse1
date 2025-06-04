class AttendanceRecord {
  final DateTime date;
  final String checkIn;
  final String checkOut;
  final String status;

  AttendanceRecord({
    required this.date,
    required this.checkIn,
    required this.checkOut,
    required this.status,
  });
}
