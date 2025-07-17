import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: ProfileSettingsForm()));
  }
}

class ProfileSettingsForm extends StatefulWidget {
  const ProfileSettingsForm({super.key});

  @override
  State<ProfileSettingsForm> createState() => _ProfileSettingsFormState();
}

class _ProfileSettingsFormState extends State<ProfileSettingsForm> {
  String _username = '';
  bool _agreedToTerms = false;
  bool _notificationsEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
              hintText: 'obaid',
            ),
            onChanged: (value) {
              setState(() {
                _username = value;
              });
            },
          ),
          SizedBox(height: 10),
          CheckboxListTile(
            activeColor: Colors.green,
            checkColor: Colors.white,
            value: _agreedToTerms,
            title: Text('I agree to terms and conditions'),
            tileColor: Colors.cyanAccent,
            onChanged: (bool? value) {
              setState(() {
                _agreedToTerms = value ?? false;
              });
            },
          ),
          SizedBox(height: 15),
          SwitchListTile(
            value: _notificationsEnabled,
            title: Text('Enable Notifications'),
            onChanged: (bool? value) {
              setState(() {
                _notificationsEnabled = value ?? false;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              print('Settings Saved');
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Settings Saved!')));
            },
            child: Text('Save Settings'),
          ),
        ],
      ),
    );
  }
}
