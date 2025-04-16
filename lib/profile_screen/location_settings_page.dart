import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
class LocationSettingsPage extends StatefulWidget {
  @override
  _LocationSettingsPageState createState() => _LocationSettingsPageState();
}

class _LocationSettingsPageState extends State<LocationSettingsPage> {
  bool allowLocationAccess = false;
  bool alertForBloodRequest = false;
  String selectedRadius = "20 miles";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Settings',
          style: TextStyle(fontWeight: FontWeight.bold),),
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
            SizedBox(height: 40),
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
    );
  }

  Widget _buildSwitchTile(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "•  ",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
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
                              fontSize: 17,
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
          SizedBox(height: 12),
        ],
      ),
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
                  "•",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 6),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: 32,
            width: 100,
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
                icon: Icon(Icons.arrow_drop_down, size: 18),
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500,color: Colors.black),
                dropdownColor: Colors.white,
                items: options.map((option) => DropdownMenuItem(
                  value: option,
                  child: Text(option, style: TextStyle(fontSize: 13)),
                )).toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
