import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpalife_mobile/profile_screen/give_us_feedback_page.dart';
import 'package:helpalife_mobile/profile_screen/help_center_page.dart';
import 'package:helpalife_mobile/profile_screen/privacy_policy_page.dart';
import 'package:helpalife_mobile/profile_screen/terms_of_service_page.dart';

import 'location_settings_page.dart';
import 'notification_settings_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void _navigateTo(Widget page) {
    Get.to(() => page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'), centerTitle: true),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildProfileHeader(),
          SizedBox(height: 20),
          _buildSectionTitle('Settings'),
          _buildListTile(
            Icons.location_on,
            'Location settings',
            () => _navigateTo(LocationSettingsPage()),
          ),
          Divider(), // Horizontal line
          _buildListTile(
            Icons.notifications,
            'Notification Settings',
            () => _navigateTo(NotificationSettingsPage()),
          ),
          Divider(),
          SizedBox(height: 20),
          _buildSectionTitle('Support'),
          _buildListTile(
            Icons.help_outline,
            'Help Center',
            () => _navigateTo(HelpCenterPage()),
          ),
          Divider(),
          _buildListTile(
            Icons.feedback,
            'Give us feedback',
            () => _navigateTo(GiveUsFeedbackPage()),
          ),
          Divider(),
          SizedBox(height: 20),
          _buildSectionTitle('Legal'),
          _buildListTile(
            Icons.description,
            'Terms of Service',
            () => _navigateTo(TermsOfServicePage()),
          ),
          Divider(),
          _buildListTile(
            Icons.privacy_tip,
            'Privacy Policy',
            () => _navigateTo(PrivacyPolicyPage()),
          ),
          Divider(),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    // Handle logout action
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, // Remove default padding
                    minimumSize: Size(0, 0), // Avoid extra spacing
                    tapTargetSize:
                        MaterialTapTargetSize.shrinkWrap, // Reduce touch area
                  ),
                  child: Text(
                    'Log out',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500, // Match the Figma design
                    ),
                  ),
                ),
                SizedBox(height: 4), // Space between text and line
                Container(
                  width: 50, // Adjust dynamically if needed
                  height: 1.5, // Thickness of the line
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.black,
          child: Text(
            'R',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Richard',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              'Richard123@gmail.com',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
      onTap: onTap,
    );
  }
}
