import 'package:flutter/material.dart';
import '../models/fee_model.dart';

class FeeViewModel extends ChangeNotifier {
  final List<FeeRecord> _feeRecords = [
    FeeRecord(
      studentId: 'BGS-12354',
      studentName: 'Guy Hawkins Howkins',
      grade: 'Montessori 1',
      feeType: 'Monthly',
      status: 'Pending',
      amount: '7,500',
      voucherNo: 'HBL: 85652156',
      ibillNo: '1Bill: 100114510285652156',
    ),
    // Add more sample records if needed
  ];

  List<FeeRecord> get feeRecords => _feeRecords;

  // Future implementation: fetch from API
  // void fetchFeeRecords() async { ... notifyListeners(); }
}
