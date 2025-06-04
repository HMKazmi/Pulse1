import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/attendance_viewmodel.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String _activeMonth = 'January';
  String _activeYear = '2025';

  void _setActiveMonth(String month) {
    setState(() {
      _activeMonth = month; // Update the active month;
    });
  }

  void _setActiveYear(String year) {
    setState(() {
      _activeYear = year; // Update the active month;
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AttendanceViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('History'),
        leading: const BackButton(),
        actions: [
          IconButton(icon: const Icon(Icons.home_outlined), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 6),
                Text("Month: ", style: TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _activeMonth,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor:
                          Theme.of(
                            context,
                          ).colorScheme.background, // Background color
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey, // Border color
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color:
                              Colors
                                  .grey, // Same color on focus (customize if needed)
                          width: 1.0,
                        ),
                      ),
                    ),
                    items:
                        [
                          'January',
                          'February',
                          'March',
                          'April',
                          'May',
                          'June',
                          'July',
                          'August',
                          'September',
                          'October',
                          'November',
                          'December',
                        ].map((month) {
                          return DropdownMenuItem<String>(
                            value: month,
                            child: Text(month),
                          );
                        }).toList(),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() {
                          _setActiveMonth(val);
                        });
                      }
                    },
                  ),
                ),

                const SizedBox(width: 8),
                Text("Year: ", style: TextStyle(fontSize: 16)),
                const SizedBox(width: 8),

                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _activeYear,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor:
                          Theme.of(
                            context,
                          ).colorScheme.background, // Background color
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey, // Border color
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color:
                              Colors
                                  .grey, // Same color on focus (customize if needed)
                          width: 1.0,
                        ),
                      ),
                    ),
                    items:
                        ['2022', '2023', '2024', '2025'].map((month) {
                          return DropdownMenuItem<String>(
                            value: month,
                            child: Text(month),
                          );
                        }).toList(),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() {
                          _setActiveYear(val);
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                tileColor: Colors.white,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: const Text('Current Week'),
                subtitle: Row(
                  children: [
                    Text('Presents: ', style: TextStyle(color: Colors.black)),
                    Text(
                      '${viewModel.currentWeekPresents}',
                      style: TextStyle(color: Colors.green),
                    ),
                    const SizedBox(width: 10),
                    Text('Leaves: ', style: TextStyle(color: Colors.black)),
                    Text(
                      '${viewModel.currentWeekLeaves}',
                      style: TextStyle(color: Colors.blue),
                    ),
                    const SizedBox(width: 10),
                    Text('Absents: ', style: TextStyle(color: Colors.black)),
                    Text(
                      '${viewModel.currentWeekAbsents}',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: const Text('Current Month'),
                subtitle: Row(
                  children: [
                    Text('Presents: ', style: TextStyle(color: Colors.black)),
                    Text(
                      '${viewModel.currentMonthPresents}',
                      style: TextStyle(color: Colors.green),
                    ),
                    const SizedBox(width: 10),
                    Text('Leaves: ', style: TextStyle(color: Colors.black)),
                    Text(
                      '${viewModel.currentMonthLeaves}',
                      style: TextStyle(color: Colors.blue),
                    ),
                    const SizedBox(width: 10),
                    Text('Absents: ', style: TextStyle(color: Colors.black)),
                    Text(
                      '${viewModel.currentMonthAbsents}',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.records.length,
                itemBuilder: (context, index) {
                  final record = viewModel.records[index];
                  return ListTile(
                    tileColor: Colors.white,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: Container(
                      padding: const EdgeInsets.only(left: 8),
                      width: double.infinity,
                      color: Colors.grey,
                      child: Text(DateFormat('MM/dd/yyyy').format(record.date)),
                    ),
                    subtitle: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Check-in: \n${record.checkIn}'),
                        const SizedBox(width: 32),
                        Text('Check-out: \n${record.checkOut}'),
                        Spacer(),
                        Text(
                          record.status,
                          style: TextStyle(
                            color:
                                record.status == "Present"
                                    ? Colors.green
                                    : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
