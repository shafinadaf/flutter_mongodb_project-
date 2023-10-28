import 'package:hdbrts/constants/global_variables.dart';
import 'package:flutter/material.dart';

class ShowTicket extends StatefulWidget {
  static const String routeName = '/ticket';
  const ShowTicket({Key? key}) : super(key: key);

  @override
  State<ShowTicket> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ShowTicket> {
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
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                      fontSize: 15,
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
            children: const [
              Text(
                'TICKET',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
