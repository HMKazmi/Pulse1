import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/fee_viewmodel.dart';

class FeeScreen extends StatelessWidget {
  const FeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FeeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Fee Management'),
        leading: const BackButton(),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.home))],
      ),
      body: ListView.builder(
        itemCount: viewModel.feeRecords.length,
        itemBuilder: (context, index) {
          final fee = viewModel.feeRecords[index];
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.all(12),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Student ID:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(fee.studentId),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Amount:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(fee.amount),
                        ],
                      ),
                      Spacer(),
                      ElevatedButton.icon(
                        
                        iconAlignment: IconAlignment.end,
                        icon: const Icon(Icons.history, color: Colors.black),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(16, 24),
                          maximumSize: const Size(120, 24),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.grey[100],
                        ),
                        onPressed: () {},
                        label: const Text('History'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Student Name:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(fee.studentName),
                        ],
                      ),
                      const SizedBox(width: 48),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Grade:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(fee.grade),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fee Type:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(fee.feeType),
                        ],
                      ),
                      const SizedBox(width: 128),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Status:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(fee.status),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Voucher Number:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(fee.voucherNo),
                  Text(fee.ibillNo),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.grey[100],
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            const Text('View PDF'),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        iconAlignment: IconAlignment.end,
                        icon: const Icon(Icons.download, color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {},
                        label: const Text('Download PDF'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
