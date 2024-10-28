import 'package:e_group_x/UI/Screens/onboarding_screen.dart';
import 'package:e_group_x/UI/Screens/zaka_registration/registration_screen.dart';
import 'package:e_group_x/provider/login_provider.dart';
import 'package:e_group_x/provider/registration_provider.dart';
import 'package:e_group_x/provider/transaction_provider.dart';
import 'package:e_group_x/resources/screen_routes.dart';
import 'package:e_group_x/ui/screens/bank_transfer_screen.dart';
import 'package:e_group_x/ui/screens/main_menu_screen.dart';
import 'package:e_group_x/ui/screens/view_details_screen.dart';
import 'package:e_group_x/ui/screens/zaka_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zaka App',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const OnboardingScreen(),
      routes: {
        loginScreen: (_) => ChangeNotifierProvider(
              create: (_) => LoginProvider(),
              child: const ZakaLoginScreen(),
            ),
        onboardingScreen: (_) => const OnboardingScreen(),
        mainMenuScreen: (_) => const MainMenuScreen(),
        bankTransferScreen: (_) => ChangeNotifierProvider(
              create: (_) => TransactionProvider(),
              child: BankTransferScreen(),
            ),
        registrationScreen: (_) => ChangeNotifierProvider(
              create: (_) => RegistrationProvider(),
              child: const RegistrationScreen(),
            ),
        viewDetailsScreen: (_) => ViewDetailsScreen()
      },
    );
  }
}
