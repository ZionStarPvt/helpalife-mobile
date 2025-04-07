import 'package:flutter/material.dart';
import 'package:helpalife_mobile/constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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
  final _locationController = TextEditingController();

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
          _buildValidatedTextField("Full Name", _nameController, validator: (value) {
            if (value == null || value.trim().isEmpty) return 'Required';
            return null;
          }),
          _buildValidatedTextField("Email Address", _emailController, validator: (value) {
            if (value == null || !RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value.trim())) {
              return 'Invalid Email';
            }
            return null;
          }),
          _buildValidatedTextField("Password", _passwordController, obscureText: true, validator: (value) {
            if (value == null || value.isEmpty) return 'Required';
            return null;
          }),
          _buildValidatedTextField("Confirm Password", _confirmPasswordController, obscureText: true, validator: (value) {
            if (value != _passwordController.text) return 'Passwords do not match';
            return null;
          }),
          _buildLocationField(),
          _buildPhoneNumberField(),
         _buildBloodGroupField()
        ],
      ),
    );
  }

  Widget _buildValidatedTextField(String label, TextEditingController controller,
      {bool obscureText = false, String? Function(String?)? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 10, color: Colors.grey[400])),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          decoration: inputDecoration()
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildPhoneNumberField() {
    return FormField<String>(
      validator: (_) {
        final phone = _phoneController.text.trim();
        if (phone.isEmpty || !RegExp(r'^\d+$').hasMatch(phone)) {
          return 'Invalid phone number';
        }
        return null;
      },
      builder: (state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Phone Number", style: TextStyle(fontSize: 10, color: Colors.grey[400])),
          SizedBox(height: 5),
          IntlPhoneField(
            controller: _phoneController,
            initialCountryCode: 'IN',
            decoration: inputDecoration(),
            onChanged: (phone) {
              _phoneController.text = phone.number;
              state.didChange(phone.number);
            },
          ),
          if (state.hasError)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(state.errorText!, style: TextStyle(color: Colors.red, fontSize: 12)),
            ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildLocationField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Location", style: TextStyle(fontSize: 10, color: Colors.grey[400])),
        SizedBox(height: 5),
        DropdownButtonFormField<String>(
          value: _locationController.text.isNotEmpty ? _locationController.text : null,
          items: _locations
              .map((location) => DropdownMenuItem(
            value: location,
            child: Text(location),
          ))
              .toList(),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            suffixIcon: IconButton(
              icon: Icon(Icons.my_location),
              onPressed: () {
                },
            ),
          ),
          onChanged: (value) {
            setState(() {
              _locationController.text = value!;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) return 'Required';
            return null;
          },
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildBloodGroupField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Blood Group", style: TextStyle(fontSize: 10, color: Colors.grey[400])),
        SizedBox(height: 5),
        DropdownButtonFormField<String>(
          value: _selectedBloodGroup,
          decoration: inputDecoration(),
          validator: (value) => value == null ? 'Please select a blood group' : null,
          items: _bloodGroups.map((group) => DropdownMenuItem(value: group, child: Text(group))).toList(),
          onChanged: (value) {
            setState(() {
              _selectedBloodGroup = value;
            });
          },
        ),
      ],
    );
  }
}
