import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class NotificationSettingsPage extends StatefulWidget {
  @override
  _NotificationSettingsPageState createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool emailNotifications = false;
  bool pushNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back, size: 28),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSwitchTile(
              'Notify me via email',
              'Get updates about your donations and blood needs\nvia email',
               emailNotifications,
               (value) {
                setState(() {
                  emailNotifications = value;
                });
              },
            ),
            SizedBox(height: 20),
            _buildSwitchTile(
             'Enable push notifications',
              'Get real-time notifications directly on your browser\nfor immediate needs.',
               pushNotifications,
              (value) {
                setState(() {
                  pushNotifications = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '•  ',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (subtitle.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        subtitle,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                ],
              ),
            ),
            FlutterSwitch(
              width: 42.0,
              height: 22.0,
              toggleSize: 18.0,
              value: value,
              borderRadius: 20.0,
              activeColor: Colors.black,
              inactiveColor: Colors.grey.shade400,
              toggleColor: Colors.white,
              padding: 2.0,
              onToggle: onChanged,
            ),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
