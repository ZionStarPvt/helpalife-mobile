import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../constants.dart';
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
            buildSwitchTile(
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
            buildSwitchTile(
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
