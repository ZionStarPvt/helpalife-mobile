import 'package:flutter/material.dart';
import 'package:helpalife_mobile/constants.dart';
import 'blood_group_dropdown.dart';
import 'location_field.dart';
import 'phone_number_field.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  RegistrationFormState createState() => RegistrationFormState();
}

class RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  String? _selectedLocation;
  String? _selectedBloodGroup;

  final _locations = ["Chennai", "Coimbatore", "Madurai", "Trichy", "Salem"];
  final _bloodGroups = ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"];

  bool validateForm() {
    return _formKey.currentState?.validate() ?? false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildValidatedTextField(
            "Full Name",
            _nameController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) return 'Required';
              return null;
            },
          ),
          buildValidatedTextField(
            "Email Address",
            _emailController,
            validator: (value) {
              if (value == null ||
                  !RegExp(
                    r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                  ).hasMatch(value.trim())) {
                return 'Invalid Email';
              }
              return null;
            },
          ),
          buildValidatedTextField(
            "Password",
            _passwordController,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Required';
              return null;
            },
          ),
          buildValidatedTextField(
            "Confirm Password",
            _confirmPasswordController,
            obscureText: true,
            validator: (value) {
              if (value != _passwordController.text)
                return 'Passwords do not match';
              return null;
            },
          ),
          LocationField(
            selectedLocation: _selectedLocation,
            locations: _locations,
            onChanged: (value) {
              setState(() {
                _selectedLocation = value;
              });
            },
          ),
          PhoneNumberField(controller: _phoneController),
          BloodGroupDropdown(
            bloodGroups: _bloodGroups,
            selectedGroup: _selectedBloodGroup,
            onChanged: (value) {
              setState(() {
                _selectedBloodGroup = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
