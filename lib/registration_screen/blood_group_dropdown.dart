import 'package:flutter/material.dart';

class BloodGroupDropdown extends StatelessWidget {
  final List<String> bloodGroups;
  final String? selectedGroup;
  final Function(String?) onChanged;

  const BloodGroupDropdown({
    super.key,
    required this.bloodGroups,
    required this.selectedGroup,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Blood Group", style: TextStyle(fontSize: 10, color: Colors.grey[400])),
        SizedBox(height: 5),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
          ),
          value: selectedGroup,
          validator: (value) => value == null ? 'Please select a blood group' : null,
          items: bloodGroups.map(
                (group) => DropdownMenuItem(
              value: group,
              child: Text(group),
            ),
          ).toList(),
          onChanged: onChanged,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}