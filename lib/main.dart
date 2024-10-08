import 'package:breaktime/screens/articles_screen.dart';
import 'package:breaktime/screens/break_activities_screen.dart';
import 'package:breaktime/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/home_screen.dart';
import 'screens/schedule_screen.dart';

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
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegistrationScreen(),
        '/home': (context) => const HomeScreen(),
        '/activities': (context) => const BreakActivitiesScreen(),
        '/schedule': (context) => const ScheduleScreen(),
        '/articles': (context) => const ArticlesScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
