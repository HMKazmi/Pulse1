import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  bool isLoading = true;
  AttendanceData? attendanceData;
  List<Student> students = [];

  @override
  void initState() {
    super.initState();
    _loadAttendanceData();
  }

  // Simulate API call for attendance data
  Future<void> _loadAttendanceData() async {
    setState(() {
      isLoading = true;
    });

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock API response
    setState(() {
      attendanceData = AttendanceData(
        studentName: "Guy Hawkins",
        studentId: "BGS-15346",
        grade: "4",
        section: "4-B",
        avatarUrl: "https://example.com/avatar.jpg",
        todayAttendance: TodayAttendance(
          checkIn: "07:58",
          checkOut: "01:05",
          lastDayCheckIn: "07:58",
          lastDayCheckOut: "01:05",
        ),
        overallAttendance: 80,
        attendanceSummary: AttendanceSummary(
          daysPresent: 123,
          daysOnLeave: 11,
          daysAbsent: 3,
        ),
        attendanceHistory: [
          AttendanceRecord(
            date: "05/13/2025",
            checkIn: "07:58 AM",
            checkOut: "02:08 PM",
            status: AttendanceStatus.present,
          ),
          AttendanceRecord(
            date: "05/12/2025",
            checkIn: "07:58 AM",
            checkOut: "02:08 PM",
            status: AttendanceStatus.present,
          ),
          AttendanceRecord(
            date: "05/11/2025",
            checkIn: "07:58 AM",
            checkOut: "02:08 PM",
            status: AttendanceStatus.present,
          ),
          AttendanceRecord(
            date: "05/10/2025",
            checkIn: "07:58 AM",
            checkOut: "02:08 PM",
            status: AttendanceStatus.present,
          ),
        ],
      );

      students = [
        Student(
          name: "Guy Hawkins",
          id: "BGS-15346",
          grade: "4",
          section: "4-B",
          avatarUrl: "https://example.com/avatar1.jpg",
        ),
        Student(
          name: "Guy Hawkins",
          id: "BGS-15346",
          grade: "4",
          section: "4-B",
          avatarUrl: "https://example.com/avatar2.jpg",
        ),
        Student(
          name: "Guy Hawkins",
          id: "BGS-15346",
          grade: "4",
          section: "4-B",
          avatarUrl: "https://example.com/avatar3.jpg",
        ),
      ];

      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Attendance Tracking',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.home_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                child: Column(
                  children: [
                    if (attendanceData != null) _buildMainStudentCard(),
                    const SizedBox(height: 16),
                    if (attendanceData != null) _buildTodayAttendance(),
                    const SizedBox(height: 16),
                    if (attendanceData != null) _buildAttendanceSummary(),
                    const SizedBox(height: 16),
                    if (attendanceData != null) _buildAttendanceHistory(),
                    const SizedBox(height: 16),
                    _buildOtherStudents(),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }

  Widget _buildMainStudentCard() {
    final data = attendanceData!;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, color: Colors.white, size: 30),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.studentName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'ID: ${data.studentId}',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                Text(
                  'Grade: ${data.grade}  Section: ${data.section}',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          const Icon(Icons.keyboard_arrow_up, color: Colors.grey, size: 24),
        ],
      ),
    );
  }

  Widget _buildTodayAttendance() {
    final data = attendanceData!;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Today's Attendance",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                            const SizedBox(height: 5),

                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Check-In: ${data.todayAttendance.checkIn}    Check-Out: ${data.todayAttendance.checkOut}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Last day Attendance',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            'Check-In: ${data.todayAttendance.lastDayCheckIn}    Check-Out: ${data.todayAttendance.lastDayCheckOut}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${data.overallAttendance}%',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const Text(
                    'Overall Session\nAttendance',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceSummary() {
    final summary = attendanceData!.attendanceSummary;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: _buildSummaryCard(
              title: 'Days Present:',
              value: '${summary.daysPresent}',
              color: Colors.green[100]!,
              textColor: Colors.green,
            ),
          ),
          const SizedBox(width: 8),
          _buildSummaryCard(
            title: 'Days on Leaves:',
            value: '${summary.daysOnLeave}',
            color: Colors.blue[100]!,
            textColor: Colors.blue,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildSummaryCard(
              title: 'Days Absent:',
              value: '${summary.daysAbsent}',
              color: Colors.red[100]!,
              textColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String value,
    required Color color,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: textColor),
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceHistory() {
    final history = attendanceData!.attendanceHistory;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ...history.map((record) => _buildHistoryItem(record)),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.history, size: 16),
            label: const Text('History'),
            style: TextButton.styleFrom(foregroundColor: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(AttendanceRecord record) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Row(
        children: [
          const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
          const SizedBox(width: 8),
          Text(
            record.date,
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
          const Spacer(),
          Text(
            _getStatusText(record.status),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.green,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtherStudents() {
    return Column(
      children: students.map((student) => _buildStudentCard(student)).toList(),
    );
  }

  Widget _buildStudentCard(Student student) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'ID: ${student.id}',
                  style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                ),
                Text(
                  'Grade: ${student.grade}  Section: ${student.section}',
                  style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          const Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 20),
        ],
      ),
    );
  }

  String _getStatusText(AttendanceStatus status) {
    switch (status) {
      case AttendanceStatus.present:
        return 'Present';
      case AttendanceStatus.absent:
        return 'Absent';
      case AttendanceStatus.leave:
        return 'On Leave';
    }
  }
}

// Data Models
class AttendanceData {
  final String studentName;
  final String studentId;
  final String grade;
  final String section;
  final String avatarUrl;
  final TodayAttendance todayAttendance;
  final int overallAttendance;
  final AttendanceSummary attendanceSummary;
  final List<AttendanceRecord> attendanceHistory;

  AttendanceData({
    required this.studentName,
    required this.studentId,
    required this.grade,
    required this.section,
    required this.avatarUrl,
    required this.todayAttendance,
    required this.overallAttendance,
    required this.attendanceSummary,
    required this.attendanceHistory,
  });

  // Factory method to parse from API response
  factory AttendanceData.fromJson(Map<String, dynamic> json) {
    return AttendanceData(
      studentName: json['student_name'],
      studentId: json['student_id'],
      grade: json['grade'],
      section: json['section'],
      avatarUrl: json['avatar_url'],
      todayAttendance: TodayAttendance.fromJson(json['today_attendance']),
      overallAttendance: json['overall_attendance'],
      attendanceSummary: AttendanceSummary.fromJson(json['attendance_summary']),
      attendanceHistory:
          (json['attendance_history'] as List)
              .map((item) => AttendanceRecord.fromJson(item))
              .toList(),
    );
  }
}

class TodayAttendance {
  final String checkIn;
  final String checkOut;
  final String lastDayCheckIn;
  final String lastDayCheckOut;

  TodayAttendance({
    required this.checkIn,
    required this.checkOut,
    required this.lastDayCheckIn,
    required this.lastDayCheckOut,
  });

  factory TodayAttendance.fromJson(Map<String, dynamic> json) {
    return TodayAttendance(
      checkIn: json['check_in'],
      checkOut: json['check_out'],
      lastDayCheckIn: json['last_day_check_in'],
      lastDayCheckOut: json['last_day_check_out'],
    );
  }
}

class AttendanceSummary {
  final int daysPresent;
  final int daysOnLeave;
  final int daysAbsent;

  AttendanceSummary({
    required this.daysPresent,
    required this.daysOnLeave,
    required this.daysAbsent,
  });

  factory AttendanceSummary.fromJson(Map<String, dynamic> json) {
    return AttendanceSummary(
      daysPresent: json['days_present'],
      daysOnLeave: json['days_on_leave'],
      daysAbsent: json['days_absent'],
    );
  }
}

class AttendanceRecord {
  final String date;
  final String checkIn;
  final String checkOut;
  final AttendanceStatus status;

  AttendanceRecord({
    required this.date,
    required this.checkIn,
    required this.checkOut,
    required this.status,
  });

  factory AttendanceRecord.fromJson(Map<String, dynamic> json) {
    return AttendanceRecord(
      date: json['date'],
      checkIn: json['check_in'],
      checkOut: json['check_out'],
      status: AttendanceStatus.values.firstWhere(
        (e) => e.toString().split('.').last == json['status'],
      ),
    );
  }
}

class Student {
  final String name;
  final String id;
  final String grade;
  final String section;
  final String avatarUrl;

  Student({
    required this.name,
    required this.id,
    required this.grade,
    required this.section,
    required this.avatarUrl,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['name'],
      id: json['id'],
      grade: json['grade'],
      section: json['section'],
      avatarUrl: json['avatar_url'],
    );
  }
}

enum AttendanceStatus { present, absent, leave }
