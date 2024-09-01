import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class ViewBreakActivityScreen extends StatefulWidget {
  final String name;
  final String? details;

  const ViewBreakActivityScreen({
    super.key,
    required this.name,
    this.details,
  });

  @override
  _ViewBreakActivityScreenState createState() => _ViewBreakActivityScreenState();
}

class _ViewBreakActivityScreenState extends State<ViewBreakActivityScreen> {
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
              initialValue: widget.name,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            if (widget.details != null && widget.details!.isNotEmpty) ...[
              TextFormField(
                initialValue: widget.details,
                readOnly: true,
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
              onPressed: () {
                // Navigate to the edit screen
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
