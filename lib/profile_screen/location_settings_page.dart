import 'package:flutter/material.dart';
import 'package:helpalife_mobile/history_screen/history_page.dart';
import 'package:helpalife_mobile/home_screen/bottom_navigation_bar.dart';
import 'package:helpalife_mobile/home_screen/home_page.dart';
import 'package:helpalife_mobile/profile_screen/profile_page.dart';
import 'package:helpalife_mobile/registration_screen/registration_page.dart';

class LocationSettingsPage extends StatefulWidget {
  @override
  _LocationSettingsPageState createState() => _LocationSettingsPageState();
}

class _LocationSettingsPageState extends State<LocationSettingsPage> {
  bool allowLocationAccess = false;
  bool alertForBloodRequest = false;
  String selectedRadius = "20 miles";
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    Widget nextScreen;
    switch (index) {
      case 0:
        nextScreen = HomePage();
        break;
      case 1:
        nextScreen = HistoryPage();
        break;
      case 2:
        nextScreen = RegistrationPage();
        break;
      case 3:
        nextScreen = ProfilePage();
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Settings'),
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
              "Allow location access",
              "Share your location with the website to find nearby blood needs",
              allowLocationAccess,
              (value) {
                setState(() {
                  allowLocationAccess = value;
                });
              },
            ),
            SizedBox(height: 16),
            _buildDropdownTile(
              "Set default radius for nearby blood needs",
              selectedRadius,
              ["10 miles", "20 miles", "30 miles"],
              (value) {
                setState(() {
                  selectedRadius = value!;
                });
              },
            ),
            SizedBox(height: 16),
            _buildSwitchTile(
              "Get alerts for emergency blood request\nwithin your chosen radius",
              "",
              alertForBloodRequest,
              (value) {
                setState(() {
                  alertForBloodRequest = value;
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
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
        // First Row: bullet + title + switch
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "•  ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
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
            Switch(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.black,
              activeTrackColor: Colors.grey.shade700,
              inactiveThumbColor: Colors.grey.shade400,
              inactiveTrackColor: Colors.grey.shade300,
            ),
          ],
        ),
        SizedBox(height: 12),
      ],
    );
  }

  Widget _buildDropdownTile(
    String title,
    String selectedValue,
    List<String> options,
    Function(String?) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "•  ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 120,
            height: 36,
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(6),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedValue,
                isExpanded: true,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                  size: 20,
                ),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                dropdownColor: Colors.white,
                items:
                    options
                        .map(
                          (option) => DropdownMenuItem(
                            value: option,
                            child: Text(option, style: TextStyle(fontSize: 14)),
                          ),
                        )
                        .toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
