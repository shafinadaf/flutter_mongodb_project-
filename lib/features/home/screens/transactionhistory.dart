import 'package:flutter/material.dart';

class TransactionHistory extends StatefulWidget {
  static const String routeName = '/history';
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TRANSACTION HISTORY'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Transaction History:',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
