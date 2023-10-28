import 'package:hdbrts/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _selectedFromLocation;
  String? _selectedToLocation;
  String? _ticketData;
  double? _selectedTicketPrice;
  final Wallet _wallet = Wallet();
  final List<String> _locations = [
    'NEW BUSSTAND DWD',
    'JUBLI CIRCLE',
    'COURT CIRCLE',
    'NAVANAGAR',
    'UNKAL LAKE',
    'BVB',
    'CBT HUBLI',
    'RAILWAY STATION HUBLI',
    'KIMS HOSPITAL',
    'SDM HOSPITAL',
    'NTTF',
  ];
  final Map<String, Map<String, double>> _ticketPrices = {
    'NEW BUSSTAND DWD': {
      'JUBLI CIRCLE': 12.0,
      'COURT CIRCLE': 12.0,
      'NAVANAGAR': 20.0,
      'UNKAL LAKE': 25,
      'BVB': 30,
      'CBT HUBLI': 23,
      'RAILWAY STATION HUBLI': 23,
      'KIMS HOSPITAL': 23,
      'SDM HOSPITAL': 21,
      'NTTF': 21,
    },
    'JUBLI CIRCLE': {
      'COURT CIRCLE': 5.0,
      'NAVANAGAR': 10.0,
      'NEW BUSSTAND DWD': 12.0,
      'UNKAL LAKE': 25,
      'BVB': 30,
      'CBT HUBLI': 23,
      'RAILWAY STATION HUBLI': 32,
      'KIMS HOSPITAL': 23,
      'SDM HOSPITAL': 23,
      'NTTF': 23,
    },
    'COURT CIRCLE': {
      'JUBLI CIRCLE': 5.0,
      'NAVANAGAR': 10.0,
      'NEW BUSSTAND DWD': 15.0,
      'UNKAL LAKE': 25,
      'BVB': 30,
      'CBT HUBLI': 23,
      'RAILWAY STATION HUBLI': 23,
      'KIMS HOSPITAL': 32,
      'SDM HOSPITAL': 23,
      'NTTF': 23,
    },
    'NAVANAGAR': {
      'JUBLI CIRCLE': 5.0,
      'COURT CIRCLE': 10.0,
      'NEW BUSSTAND DWD': 15.0,
      'UNKAL LAKE': 25,
      'BVB': 30,
      'CBT HUBLI': 23,
      'RAILWAY STATION HUBLI': 23,
      'KIMS HOSPITAL': 32,
      'SDM HOSPITAL': 33,
      'NTTF': 22,
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/logo1.png',
                width: 120,
                height: 45,
                color: const Color.fromARGB(255, 247, 244, 244),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: const [
                  Text(
                    'WELCOME TO',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'HUBLI-DHARWAD BUS RAPID TRANSIST SYSTEM',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'BUY TICKET',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'From:',
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 10.0),
              DropdownButtonFormField<String>(
                value: _selectedFromLocation,
                items: _locations.map((location) {
                  return DropdownMenuItem<String>(
                    value: location,
                    child: Text(location),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedFromLocation = value;
                    _selectedTicketPrice = _getTicketPrice();
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Select from location',
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'To:',
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 10.0),
              DropdownButtonFormField<String>(
                value: _selectedToLocation,
                items: _locations.map((location) {
                  return DropdownMenuItem<String>(
                    value: location,
                    child: Text(location),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedToLocation = value;
                    _selectedTicketPrice = _getTicketPrice();
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Select to location',
                ),
              ),
              const SizedBox(height: 20.0),
              if (_selectedTicketPrice != null) ...[
                Text(
                  'Ticket price: ₹${_selectedTicketPrice!.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 10.0),
              ],
              const SizedBox(height: 10.0),
              const SizedBox(height: 20.0),
              if (_wallet.balance !=
                  null) // Add this check to show the wallet balance only if it is not null
                Text(
                  'Wallet Balance: ${_wallet.balance.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20.0),
                ),
              ElevatedButton(
                onPressed: () {
                  if (_selectedTicketPrice! > _wallet.balance) {
                    // show alert message that wallet balance is not enough
                    return;
                  }

                  setState(() {
                    _wallet.subtract(_selectedTicketPrice!);
                  });

                  _ticketData =
                      'From: $_selectedFromLocation\nTo: $_selectedToLocation\nTime: ${DateTime.now()}';
                },
                child: const Text('Pay with wallet'),
              ),
              if (_ticketData != null)
                QrImage(
                  data: _ticketData!,
                  version: QrVersions.auto,
                  size: 100.0,
                ),
            ],
          ),
        ),
      ),
    );
  }

  double? _getTicketPrice() {
    if (_selectedFromLocation != null && _selectedToLocation != null) {
      return _ticketPrices[_selectedFromLocation!]?[_selectedToLocation!];
    } else {
      return null;
    }
  }
}

class Wallet {
  double _balance = 500;

  double get balance => _balance;

  void add(double amount) {
    _balance += amount;
  }

  void subtract(double amount) {
    _balance -= amount;
  }
}
