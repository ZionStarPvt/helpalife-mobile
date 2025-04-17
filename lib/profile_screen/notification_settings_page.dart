import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../constants.dart';
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
            buildSwitchTile(
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
            buildSwitchTile(
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


}
