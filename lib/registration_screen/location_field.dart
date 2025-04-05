import 'package:flutter/material.dart';

class LocationField extends StatelessWidget {
  final String? selectedLocation;
  final List<String> locations;
  final Function(String?) onChanged;

  const LocationField({
    super.key,
    required this.selectedLocation,
    required this.locations,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location",
          style: TextStyle(fontSize: 10, color: Colors.grey[400]),
        ),
        SizedBox(height: 5),
        DropdownButtonFormField<String>(
          value: selectedLocation,
          onChanged: onChanged,
          items: locations
              .map((place) => DropdownMenuItem(
            value: place,
            child: Text(place),
          ))
              .toList(),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            suffixIcon: IconButton(
              icon: Icon(Icons.my_location),
              onPressed: () {

              },
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) return 'Required';
            return null;
          },
        ),
        SizedBox(height: 10),
      ],
    );
  }
}