import 'dart:io' show File;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:helpalife_mobile/constants.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _locationController = TextEditingController();

  File? imageFile;
  String? _selectedBloodGroup;

  final _bloodGroups = ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"];

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  bool _validateForm() {
    return _formKey.currentState?.validate() ?? false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    const Center(
                      child: Text(
                        "Register as a Donor",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.black,
                            backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
                            child: imageFile == null
                                ? const Icon(Icons.person, size: 40, color: Colors.white)
                                : null,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: _pickImage,
                              child: const CircleAvatar(
                                radius: 13,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.black,
                                  child: Icon(Icons.camera_alt, size: 11, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _buildValidatedTextField("Name", _nameController, validator: (value) {
                            if (value == null || value.trim().isEmpty) return 'Required';
                            if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value.trim())) {
                              return 'Only letters allowed';
                            }
                            return null;
                          },),
                          _buildValidatedTextField("Email Address", _emailController, validator: (value) {
                            if (value == null || !RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value.trim())) {
                              return 'Invalid Email';
                            }
                            return null;
                          }),
                          _buildValidatedTextField("Password", _passwordController,
                              obscureText: true, validator: (value) {
                                if (value == null || value.isEmpty) return 'Required';
                                return null;
                              }),
                          _buildValidatedTextField("Confirm Password", _confirmPasswordController,
                              obscureText: true, validator: (value) {
                                if (value != _passwordController.text) return 'Passwords do not match';
                                return null;
                              }),
                          _buildLocationField(),
                          _buildPhoneNumberField(),
                          _buildBloodGroupField(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    if (_validateForm()) {
                      print("Registering user...");
                    } else {
                      print("Invalid form");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDF2443),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildValidatedTextField(
      String label,
      TextEditingController controller, {
        bool obscureText = false,
        String? Function(String?)? validator,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          decoration: inputDecoration(),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

 _buildPhoneNumberField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Phone Number", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        const SizedBox(height: 5),
        IntlPhoneField(
          controller: _phoneController,
          initialCountryCode: 'IN',
          decoration: inputDecoration(),
          validator: (phone) {
            final phoneText = phone?.number.trim() ?? '';
            if (phoneText.isEmpty || !RegExp(r'^\d{10}$').hasMatch(phoneText)) {
              return 'Invalid phone number';
            }
            return null;
          },
          onChanged: (phone) {
            _phoneController.text = phone.number;
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  _buildLocationField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Location", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        SizedBox(height: 5),
        TextFormField(
          controller: _locationController,
          readOnly: true,
          validator: (value) {
            if (value == null || value.trim().isEmpty) return 'Required';
            return null;
          },
          decoration: inputDecoration(
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_drop_down),
                VerticalDivider(width: 1),
                IconButton(icon: Icon(Icons.my_location), onPressed: getLocation,),
              ],
            ),
          ),
          onTap: () {}, // open location picker
        ),
        SizedBox(height: 10),
      ],
    );
  }

  _buildBloodGroupField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Blood Group", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        const SizedBox(height: 5),
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


  Future<void> getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }
    List<Placemark> placemarks = await placemarkFromCoordinates(13.0827, 80.2707);

    if (placemarks.isNotEmpty) {
      final place = placemarks.first;
      final address = '${place.locality}, ${place.country}';
      print("Address: $address");
      setState(() {
        _locationController.text = address;
      });
    }
  }
}
