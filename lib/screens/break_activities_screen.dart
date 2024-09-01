import 'package:breaktime/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'add_break_activity_screen.dart';
import 'home_screen.dart';

class BreakActivitiesScreen extends StatefulWidget {
  const BreakActivitiesScreen({super.key});

  @override
  _BreakActivitiesScreenState createState() => _BreakActivitiesScreenState();
}

class _BreakActivitiesScreenState extends State<BreakActivitiesScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    handleBottomNavigationTap(context, index);
    setState(() {
      _selectedIndex = index;
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

            if (result == 'add') {
              showCustomSnackBar(context, 'Break activity saved!');
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildActivityItem('Stretch'),
            const SizedBox(height: 16),
            _buildActivityItem('Drink water'),
            const SizedBox(height: 16),
            _buildActivityItem('Walk'),
            const SizedBox(height: 16),
            _buildActivityItem('Run'),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildActivityItem(String title) {
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
            title,
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
