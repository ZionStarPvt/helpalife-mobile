import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpalife_mobile/profile_screen/give_us_feedback_page.dart';
import 'package:helpalife_mobile/profile_screen/help_center_page.dart';
import 'package:helpalife_mobile/profile_screen/privacy_policy_page.dart';
import 'package:helpalife_mobile/profile_screen/terms_of_service_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login-api/phone_login_screen.dart';
import 'location_settings_page.dart';
import 'notification_settings_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAll(() => PhoneLogin());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            _buildProfileHeader(),
            SizedBox(height: 20),
            _buildSectionTitle('Settings'),
            _buildListTile(
              Icons.location_on_outlined,
              'Location settings',
                  () => Get.to(() => LocationSettingsPage()),
            ),
            Divider(), // Horizontal line
            _buildListTile(
              Icons.notifications_outlined,
              'Notification Settings',
                  () => Get.to(() => NotificationSettingsPage()),
            ),
            Divider(),
            SizedBox(height: 20),
            _buildSectionTitle('Support'),
            _buildListTile(
              Icons.help_outline,
              'Help Center',
                  () => Get.to(() => HelpCenterPage()),
            ),
            Divider(),
            _buildListTile(
              Icons.edit_outlined,
              'Give us feedback',
                  () => Get.to(() => GiveUsFeedbackPage()),
            ),
            Divider(),
            SizedBox(height: 20),
            _buildSectionTitle('Legal'),
            _buildListTile(
              Icons.menu_book_outlined,
              'Terms of Service',
                  () => Get.to(() => TermsOfServicePage()),
            ),
            Divider(),
            _buildListTile(
              Icons.menu_book_outlined,
              'Privacy Policy',
                  () => Get.to(() => PrivacyPolicyPage()),
            ),
            Divider(),
            SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Confirm Logout"),
                          content: Text("Are you sure you want to logout?"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); 
                                logout(context);
                              },
                              child: Text("Logout"),
                            ),
                          ],
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Log out',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(width: 55, height: 1.5, color: Colors.black),
                ],
              ),
            ),
          ],
        ),
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
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      contentPadding: EdgeInsets.zero, // Remove extra horizontal padding
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
      onTap: onTap,
    );
  }
}
