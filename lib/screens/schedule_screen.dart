import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'home_screen.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int _selectedIndex = 0;

  final Map<String, TimeOfDay?> _startTimes = {
    'Monday': const TimeOfDay(hour: 9, minute: 0),
    'Tuesday': const TimeOfDay(hour: 9, minute: 0),
    'Wednesday': const TimeOfDay(hour: 9, minute: 0),
    'Thursday': const TimeOfDay(hour: 9, minute: 0),
    'Friday': const TimeOfDay(hour: 9, minute: 0),
    'Saturday': const TimeOfDay(hour: 9, minute: 0),
    'Sunday': const TimeOfDay(hour: 9, minute: 0),
  };

  final Map<String, TimeOfDay?> _endTimes = {
    'Monday': const TimeOfDay(hour: 17, minute: 0),
    'Tuesday': const TimeOfDay(hour: 17, minute: 0),
    'Wednesday': const TimeOfDay(hour: 17, minute: 0),
    'Thursday': const TimeOfDay(hour: 17, minute: 0),
    'Friday': const TimeOfDay(hour: 17, minute: 0),
    'Saturday': const TimeOfDay(hour: 17, minute: 0),
    'Sunday': const TimeOfDay(hour: 17, minute: 0),
  };

  void _selectTime(BuildContext context, String day, bool isStart) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStart ? _startTimes[day]! : _endTimes[day]!,
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          _startTimes[day] = picked;
        } else {
          _endTimes[day] = picked;
        }
      });
    }
  }

  String _formatTimeOfDay(TimeOfDay time) {
    final format = MaterialLocalizations.of(context).formatTimeOfDay;
    return format(time);
  }

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
        title: 'Schedule',
        onBackButtonPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: _startTimes.keys.map((day) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          day,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text('Start'),
                        GestureDetector(
                          onTap: () => _selectTime(context, day, true),
                          child: AbsorbPointer(
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                border: const OutlineInputBorder(),
                                hintText: _formatTimeOfDay(_startTimes[day]!),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        const Text('End'),
                        GestureDetector(
                          onTap: () => _selectTime(context, day, false),
                          child: AbsorbPointer(
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                border: const OutlineInputBorder(),
                                hintText: _formatTimeOfDay(_endTimes[day]!),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList()
            ..add(
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle save action
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Save', style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
