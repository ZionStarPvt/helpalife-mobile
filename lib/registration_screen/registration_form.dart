import 'package:flutter/material.dart';

import 'blood_group_dropdown.dart';
import 'confirm_password_field.dart';
import 'email_field.dart';
import 'location_field.dart';
import 'name_field.dart';
import 'password_field.dart';
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
          NameField(controller: _nameController),
          EmailField(controller: _emailController),
          PasswordField(controller: _passwordController),
          ConfirmPasswordField(
            controller: _confirmPasswordController,
            passwordController: _passwordController,
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
