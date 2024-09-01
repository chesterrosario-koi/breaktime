import 'package:flutter/material.dart';
import '../models/activity.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'add_break_activity_screen.dart';
import 'view_break_activity_screen.dart';
import 'home_screen.dart';
import '../utils/snackbar_utils.dart';

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

  void _deleteActivity(int index) {
    setState(() {
      activities.removeAt(index);
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

            if (result != null && result is Map<String, String>) {
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
              child: GestureDetector(
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewBreakActivityScreen(
                        name: activities[index].name,
                        details: activities[index].details,
                      ),
                    ),
                  );

                  if (result == 'delete') {
                    _deleteActivity(index);
                    showCustomSnackBar(context, 'Break activity deleted!');
                  }
                },
                child: _buildActivityItem(activities[index], index),
              ),
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

  Widget _buildActivityItem(Activity activity, int index) {
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
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewBreakActivityScreen(
                    name: activity.name,
                    details: activity.details,
                  ),
                ),
              );

              if (result == 'delete') {
                _deleteActivity(index);
                showCustomSnackBar(context, 'Break activity deleted!');
              }
            },
          ),
        ],
      ),
    );
  }
}
