import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'add_break_activity_screen.dart';
import 'home_screen.dart';
import '../utils/snackbar_utils.dart';
import '../models/activity.dart';

class BreakActivitiesScreen extends StatefulWidget {
  const BreakActivitiesScreen({super.key});

  @override
  _BreakActivitiesScreenState createState() => _BreakActivitiesScreenState();
}

class _BreakActivitiesScreenState extends State<BreakActivitiesScreen> {
  int _selectedIndex = 1;

  List<Activity> activities = [
    Activity(name: 'Stretch', details: 'Stretch your arms and legs.'),
    Activity(name: 'Drink water', details: 'Drink a glass of water.'),
    Activity(name: 'Walk', details: 'Take a short walk.'),
    Activity(name: 'Run', details: 'Go for a quick run.')
  ];

  void _onItemTapped(int index) {
    handleBottomNavigationTap(context, index);
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addActivity(String name, String details) {
    setState(() {
      activities.add(Activity(name: name, details: details));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Break activities',
        showBackButton: true,
        onBackButtonPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        action: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddBreakActivityScreen()),
            );

            if (result['action'] == 'add') {
              _addActivity(result['name']!, result['details']!);
              showCustomSnackBar(context, 'Break activity saved!');
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: activities.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: _buildActivityItem(activities[index]),
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildActivityItem(Activity activity) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            activity.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.visibility),
            onPressed: () {
              // Handle view action
            },
          ),
        ],
      ),
    );
  }
}
