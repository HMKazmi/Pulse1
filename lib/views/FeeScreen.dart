import 'dart:ffi';

import 'package:flutter/material.dart';

class FeeScreen extends StatefulWidget {
  const FeeScreen({super.key});

  @override
  State<FeeScreen> createState() => _FeeScreenState();
}

class _FeeScreenState extends State<FeeScreen> {
  FeeDetails fee1 = FeeDetails(
    studentId: 101,
    studentName: 'Alice Johnson',
    studentgrade: 'Grade 3',
    feeType: 'Tuition',
    feeMonth: 'January',
    voucherNumber: 5001,
    amount: 2500.00,
    isPaid: true,
  );

  FeeDetails fee2 = FeeDetails(
    studentId: 102,
    studentName: 'Brian Smith',
    studentgrade: 'Grade 4',
    feeType: 'Transport',
    feeMonth: 'February',
    voucherNumber: 5002,
    amount: 1200.00,
    isPaid: false,
  );

  FeeDetails fee3 = FeeDetails(
    studentId: 103,
    studentName: 'Catherine Lee',
    studentgrade: 'Grade 2',
    feeType: 'Lab',
    feeMonth: 'March',
    voucherNumber: 5003,
    amount: 800.50,
    isPaid: true,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fee Details'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.home , color: Colors.white),
            onPressed: () {
              // Logic to refresh fee details
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Fee details will be displayed here.',
          style: TextStyle(fontSize: 20),
        ),
      ),

    );
  }
}

class FeeDetails {
  final int studentId;
  final String studentName;
  final String studentgrade;
  final String feeType;
  final String feeMonth;
  final int voucherNumber;
  final double amount;
  final bool isPaid;

  FeeDetails({
    required this.studentId,
    required this.studentName,
    required this.studentgrade,
    required this.feeType,
    required this.feeMonth,
    required this.voucherNumber,
    required this.amount,
    required this.isPaid,
  });
}