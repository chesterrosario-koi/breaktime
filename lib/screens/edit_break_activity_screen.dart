import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class EditBreakActivityScreen extends StatefulWidget {
  final String name;
  final String? details;

  const EditBreakActivityScreen({
    super.key,
    required this.name,
    this.details,
  });

  @override
  _EditBreakActivityScreenState createState() => _EditBreakActivityScreenState();
}

class _EditBreakActivityScreenState extends State<EditBreakActivityScreen> {
  int _selectedIndex = 1;

  late TextEditingController _nameController;
  late TextEditingController _detailsController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _detailsController = TextEditingController(text: widget.details ?? '');
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
        title: 'Edit break activity',
        showBackButton: true,
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _detailsController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Details',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty) {
                  Navigator.pop(context, {
                    'name': _nameController.text,
                    'details': _detailsController.text,
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Name cannot be empty')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text('Save', style: TextStyle(fontSize: 18)),
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
}
