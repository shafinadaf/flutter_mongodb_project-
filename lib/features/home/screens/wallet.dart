import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  static const String routeName = '/wallet';
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('wallet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'To be implimenting:',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
