import 'package:flutter/material.dart';
import 'package:hdbrts/common/widgets/bottom_bar.dart';
import 'package:hdbrts/features/auth/screens/auth_screen.dart';
import 'package:hdbrts/features/home/screens/home_screen.dart';
import 'package:hdbrts/features/home/screens/showticket.dart';
import 'package:hdbrts/features/home/screens/wallet.dart';
import 'features/home/screens/transactionhistory.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case ShowTicket.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ShowTicket(),
      );
    case TransactionHistory.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const TransactionHistory(),
      );
    case WalletScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const WalletScreen(),
      );

    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(child: Text('screen does not exist')),
        ),
      );
  }
}
