import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:pulse1/viewmodels/appointment_form_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
        ],
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/pulse_logo.png'),
              radius: 18,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Greetings!',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.black,
            padding: const EdgeInsets.all(12),
            child: const Text(
              "Monitor your kid(s) Life at BGS all in one place.",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            color: Colors.red[700],
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "You have 20 unread messages.",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Check Now >>",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                _buildTile(Icons.access_time, "Attendance\nTracking"),
                _buildTile(Icons.receipt_long, "Fee\nManagement"),
                _buildTile(Icons.directions_bus, "Bus Tracking\nLogs"),
                _buildTile(Icons.book, "Student Daily\nDiary"),
                _buildTile(Icons.medical_services, "Medical\nRecords"),
                _buildTile(Icons.people_alt, "Parent Teacher\nInteractions"),
                _buildTile(
                  Icons.sentiment_satisfied_alt,
                  "Discipline &\nAttitude",
                ),
                _buildTile(Icons.emoji_events, "Awards &\nRecognition"),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[700],
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AppointmentFormView(),
          );
        },
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }

  Widget _buildTile(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 36, color: Colors.red[700]),
          const SizedBox(height: 12),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class AppointmentFormView extends StatelessWidget {
  const AppointmentFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppointmentFormViewModel(),
      child: Consumer<AppointmentFormViewModel>(
        builder: (context, viewModel, _) {
          return AlertDialog(
            title: const Text('Appointment Booking'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text('Visit Type:'),
                      const SizedBox(
                        width: 16,
                      ), // Add spacing between label and dropdown
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          
                          value: viewModel.visitType,
                          items:
                              viewModel.visitTypes
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              viewModel.setVisitType(value);
                            }
                          },
                          decoration: const InputDecoration(
                            border:
                                OutlineInputBorder(), // optional, for a better visual
                            isDense: true, // optional, for compact layout
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Date:'),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            isDense: true,
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.calendar_today),
                              onPressed: () async {
                                final picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2100),
                                );
                                if (picked != null) {
                                  viewModel.setDate(picked);
                                }
                              },
                            ),
                          ),
                          controller: TextEditingController(
                            text:
                                viewModel.selectedDate != null
                                    ? viewModel.selectedDate!
                                        .toLocal()
                                        .toString()
                                        .split(' ')[0]
                                    : 'Date',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Time:'),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            isDense: true,
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.access_time),
                              onPressed: () async {
                                final picked = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                if (picked != null) {
                                  viewModel.setTime(picked);
                                }
                              },
                            ),
                          ),
                          controller: TextEditingController(
                            text:
                                viewModel.selectedTime != null
                                    ? viewModel.selectedTime!.format(context)
                                    : 'Time',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Class:'),
                      const SizedBox(width: 16),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: viewModel.selectedClass,
                          items:
                              viewModel.classes
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              viewModel.setClass(value);
                            }
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 12,
                        ), // Aligns with multi-line input
                        child: Text('Teacher:'),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                          ),
                          onChanged: viewModel.setTeacher,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Text('Reason:'),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          maxLines: 3,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          onChanged: viewModel.setReason,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  viewModel.requestAppointment();
                  Navigator.pop(context); // Close the form
                },
                child: const Text('Request Appointment'),
              ),
            ],
          );
        },
      ),
    );
  }
}
