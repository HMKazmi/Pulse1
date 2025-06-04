import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
          )
        ],
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=1'),
              radius: 18,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Greetings!', style: TextStyle(fontSize: 12, color: Colors.white)),
                Text('John Doe', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            )
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
                Text("You have 20 unread messages.", style: TextStyle(color: Colors.white)),
                Text("Check Now >>", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
                _buildTile(Icons.sentiment_satisfied_alt, "Discipline &\nAttitude"),
                _buildTile(Icons.emoji_events, "Awards &\nRecognition"),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[700],
        onPressed: () {},
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


  Widget _appointmentBooking(){
    return Placeholder();
  }
}
