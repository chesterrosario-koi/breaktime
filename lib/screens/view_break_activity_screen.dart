import 'package:breaktime/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'edit_break_activity_screen.dart';

class ViewBreakActivityScreen extends StatefulWidget {
  final String name;
  final String? details;
  final Function(String name, String details) onUpdate;

  const ViewBreakActivityScreen({
    super.key,
    required this.name,
    this.details,
    required this.onUpdate,
  });

  @override
  _ViewBreakActivityScreenState createState() => _ViewBreakActivityScreenState();
}

class _ViewBreakActivityScreenState extends State<ViewBreakActivityScreen> {
  int _selectedIndex = 1;
  late String name;
  late String? details;

  @override
  void initState() {
    super.initState();
    name = widget.name;
    details = widget.details;
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
        title: 'View break activity',
        showBackButton: true,
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
        action: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            _showDeleteConfirmationDialog(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              initialValue: name,
              readOnly: true,
              style: const TextStyle(color: Colors.grey),
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            if (details != null && details!.isNotEmpty) ...[
              TextFormField(
                initialValue: details,
                readOnly: true,
                style: const TextStyle(color: Colors.grey),
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Details',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
              ),
            ] else ...[
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  'No details provided for this break activity.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditBreakActivityScreen(
                      name: name,
                      details: details,
                    ),
                  ),
                );

                if (result != null && result is Map<String, String>) {
                  setState(() {
                    name = result['name']!;
                    details = result['details']!;
                  });

                  widget.onUpdate(name, details ?? '');
                  showCustomSnackBar(context, 'Break activity updated!');
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text('Edit', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete activity'),
        content: const Text('Are you sure you want to delete this break activity?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context, 'delete');
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
