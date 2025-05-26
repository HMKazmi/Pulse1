import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:   AppBar(
        title: Text('History'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 8), // Placeholder for alignment
                Text("Month"),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButton(
                    value: "January",
                    items: [
                    DropdownMenuItem(value: "January", child: Text("January")),
                    DropdownMenuItem(value: "February", child: Text("February")),
                    DropdownMenuItem(value: "March", child: Text("March")),
                  
                  ], onChanged: (value) {}),
                ),
                Text("Year"),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButton(
                    value: "2025",
                    items: [
                    DropdownMenuItem(value: "2025", child: Text("2025")),
                    DropdownMenuItem(value: "2024", child: Text("2024")),
                    DropdownMenuItem(value: "2023", child: Text("2023")),
                  
                  ], onChanged: (value) {}),
                ),
                
                SizedBox(width: 5), // Placeholder for alignment
              ],
            ),
          ],
        )
      ),

    );
  }
}