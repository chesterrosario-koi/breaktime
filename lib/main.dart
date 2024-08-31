import 'package:flutter/material.dart';
import 'screens/registration_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const BreakTimeApp());
}

class BreakTimeApp extends StatelessWidget {
  const BreakTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BreakTime',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const RegistrationScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
